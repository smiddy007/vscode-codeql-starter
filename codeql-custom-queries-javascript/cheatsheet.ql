import javascript

// Types:   describe sets of possible values
// Classes: define new types

// original query - selects if statments containing empty then blocks
from IfStmt ifStmt, Block block
where
    block = ifStmt.getThen() and
    block.getNumbStm() = 0
select ifStmt

// query using a predicate
predicate isEmpty(Block block) {
    block.getNumStmt() = 0
}
from IfStmt ifStmt
where isEmpty(ifStmt.getThen())
select ifStmt

// query using a class
class EmptyBlock extends Block {
    EmptyBlock() {
        this.getNumStmt() = 0
    }
}
// 1.
from IfStmt ifStmt
where ifStmt.getThen() instanceof
    EmptyBlock
select ifStmt
// 2.
from IfStmt ifStmt, EmptyBlock emptyBlock
where ifStmt.getThen() = emptyBlock
select ifStmt