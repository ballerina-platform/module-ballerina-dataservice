import ballerina/dataservice;
import ballerina/persist as _;
import ballerinax/persist.sql;

@dataservice:Expose
type Employee record {|
    readonly int id;
    @dataservice:Immutable
    string slotCode;
    int 'from;
    @sql:Relation {keys: ["slotCode", "from"]}
    Slot slot;
|};

type Slot record {|
    readonly string code;
    readonly int 'from;
    Employee[] employees;
|};
