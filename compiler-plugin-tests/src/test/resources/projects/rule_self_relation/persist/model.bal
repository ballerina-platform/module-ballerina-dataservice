import ballerina/dataservice;
import ballerina/persist as _;
import ballerinax/persist.sql;

@dataservice:Expose
type Employee record {|
    readonly int id;
    Employee[] reports;
    @dataservice:ReadOnly {value: 1}
    int managerId;
    @sql:Relation {keys: ["managerId"]}
    Employee manager;
|};
