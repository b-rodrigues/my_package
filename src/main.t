-- my_package — main source file
--
-- Add your T functions here. Each function should include T-Doc comments
-- starting with --# to be picked up by the documentation generator.

--# Greet someone
--#
--# A placeholder function that returns a friendly greeting.
--#
--# @name greet
--# @param name :: String The name of the person to greet.
--# @return :: String A greeting message.
--# @example
--#   greet("world")
--#   -- Returns: "Hello, world!"
--#
--# @export
greet = \(name: String -> String) sprintf("Hello, %s!", name)
