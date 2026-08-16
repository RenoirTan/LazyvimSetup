return {
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      jdtls = function(opts)
        -- JDKs used by Java projects
        opts.settings = {
          java = {
            configuration = {
              --[[
              runtimes = {
                {
                  name = "Java 17",
                  path = vim.fn.expand("~/.sdkman/candidates/java/17/"),
                },
                {
                  name = "Java 8",
                  path = vim.fn.expand("~/.sdkman/candidates/java/8/"),
                },
                {
                  name = "Java 21",
                  path = vim.fn.expand("~/.sdkman/candidates/java/21/"),
                  default = true,
                },
              },
              ]]
            },
          },
        }

        local jdtls_java = vim.env.JDTLS_JAVA
        if jdtls_java ~= nil and jdtls_java ~= "" then
          opts.cmd = { "jdtls", "--java-executable", jdtls_java }
        end

        return opts
      end,
    },
  },
}
