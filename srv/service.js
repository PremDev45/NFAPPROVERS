const cds = require('@sap/cds');
module.exports = cds.service.impl(async function () {
   let {
      RulesLevels,
      Approvers,
      RulesApprovers
   } = this.entities;

   this.before('CREATE', 'RulesLevels.drafts', async (req) => { // sevice name
      const result = await SELECT.one
         .from(RulesLevels.drafts)
         .columns('max(level) as maxLevel');

      const nextLevel = result?.maxLevel ? result.maxLevel + 1 : 1

      req.data.level = nextLevel;
      return req;
   })

   this.on('DELETE', 'RulesLevels.drafts', async (req) => {
      const { ruleName, level } = req.data   // keys come from the request

      if (!ruleName || !level) return

      const tx = cds.transaction(req)

      // Step 1: actually delete the row
      await tx.run(
         DELETE.from(RulesLevels.drafts).where({ ruleName, level })
      )

      // Shift all higher levels down by 1
      await tx.run(
         UPDATE(RulesLevels.drafts)
            .set({ level: { '-=': 1 } })       // decrement by 1
            .where({ ruleName, level: { '>': level } })
      )
      console.log()
   })

   this.on('CREATE', 'RulesApprovers.drafts', async (req, next) => {
      debugger
      var selectedData = await SELECT.from(RulesApprovers.drafts).where({ ruleName: req.data.ruleName, level: req.data.level, EmployeeID: req.data.EmployeeID })
      console.log('selectedData', selectedData);
      if (selectedData.length > 0) {
         console.log('enter')
         req.error(400, `Entry already exists for rule: ${req.data.ruleName}, level: ${req.data.level}, employee: ${req.data.EmployeeID}`);

      }
      else{
         return next();
      }
      
   })


   this.after('CREATE', 'RulesApprovers.drafts', async (data, req) => {
      debugger
      const empId = req.data.EmployeeID;
      const query = await SELECT.one.from(Approvers).where({ EmployeeID: empId });
      console.log('varAAAAAAAAAAAAA', query);
      let updatedValue;
      let ruleApproversDb = await SELECT.from(RulesApprovers.drafts).where({ EmployeeID: query.EmployeeID, EmployeeName: query.EmployeeName, ruleName: req.data.ruleName })
      // if (ruleApproversDb.length !== 0) {
         updatedValue = await UPDATE(RulesApprovers.drafts).set({ EmployeeName: query.EmployeeName }).where({ EmployeeID: query.EmployeeID, ruleName: req.data.ruleName });
      // }

      console.log('varBBBBBBBBBBBB', updatedValue);
      // req.data.EmployeeName = query.EmployeeName;
      return req;
   })
})