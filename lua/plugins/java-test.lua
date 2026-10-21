-- Java tests through neotest (Space t ...), using neotest-java.
-- neotest-java compiles via jdtls and runs JUnit 5 with the JUnit console launcher;
-- it reads the classpath from jdtls (which imports the Gradle build), not by running Gradle.
-- First-time setup: run :NeotestJava setup once to download the JUnit launcher jar.
return {
  -- Load on the :NeotestJava command or when a Java file opens, not only when neotest loads.
  { "rcasia/neotest-java", ft = "java", cmd = "NeotestJava" },
  {
    "nvim-neotest/neotest",
    dependencies = { "rcasia/neotest-java" },
    opts = { adapters = { ["neotest-java"] = {} } },
  },
  {
    "mfussenegger/nvim-jdtls",
    -- The Java extra adds its own buffer-local Space t t / t r / t T keys for jdtls'
    -- test runner, which would shadow neotest's keys in Java files. Turn them off
    -- so neotest owns Space t everywhere.
    opts = { test = false },
  },
}
