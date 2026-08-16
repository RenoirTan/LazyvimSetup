return {
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      jdtls = function(opts)
        -- JDKs used by Java projects
        opts.settings = {
          java = {
            configuration = {
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
            },
          },
        }

        -- JDK used to RUN jdtls
        opts.cmd_env = {
          JAVA_HOME = vim.fn.expand("~/.sdkman/candidates/java/21"),
        }

        return opts
      end,
    },
  },
}
