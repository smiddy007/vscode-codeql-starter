import javascript
import DataFlow::PathGraph
// for InsufficientPasswordHashAlgorithm
import semmle.javascript.security.dataflow.InsufficientPasswordHashCustomizations::InsufficientPasswordHash
import semmle.javascript.security.CryptoAlgorithms


/* 
from DataFlow::Node dollarArg
where
  dollarArg = jquery().getACall().getArgument(0)
select dollarArg
*/

/*
from DataFlow::FunctionNode plugin, DataFlow::ParameterNode optionsParam
where
  plugin = jquery().getAPropertyRead("fn").getAPropertySource() and
  optionsParam = plugin.getLastParameter()
select plugin, optionsParam
*/


class User extends ObjectExpr{
    User() {
        this.getAProperty().getName() = "email"
        and
        (this.getAProperty().getName() = "name" or this.getAProperty().getName() = "username" or this.getAProperty().getName() = "un")
        and
        (this.getAProperty().getName() = "password" or this.getAProperty().getName() = "pass" or this.getAProperty().getName() = "pw")
    }
  }



from InsufficientPasswordHashAlgorithm u
select u