local status_ok, dbee = pcall(require, 'dbee')

if not status_ok then
  return
end

dbee.setup({
  sources = {
    require("dbee.sources").MemorySource:new({
      {
        name = "kumu-local",
        type = "mysql",
        url = "mysql+ssh://forge@143.110.234.109/doadmin:egxkd9wybstl0idk@private-kumu-database-01-do-user-9078815-0.b.db.ondigitalocean.com:25060/local_testing?statusColor=005392&env=production&name=Kumu%20LA%20Staging&tLSMode=3&usePrivateKey=true&safeModeLevel=0&advancedSafeModeLevel=0&driverVersion=0&lazyload=false",
      },
      -- ...
    }),

  }
})
