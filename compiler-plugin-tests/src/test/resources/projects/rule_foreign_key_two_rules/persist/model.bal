import ballerina/dataservice;
import ballerina/persist as _;
import ballerinax/persist.sql;

@dataservice:Expose
type Employee record {|
    readonly int id;
    @dataservice:Immutable
    @dataservice:Internal {value: "x"}
    string slotCode;
    @dataservice:Immutable
    int slotSeq;
    @sql:Relation {keys: ["slotCode", "slotSeq"]}
    Slot slot;
|};

type Slot record {|
    readonly string code;
    readonly int seq;
    Employee[] employees;
|};
