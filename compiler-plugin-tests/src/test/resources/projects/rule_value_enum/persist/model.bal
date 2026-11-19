import ballerina/dataservice;
import ballerina/persist as _;

@dataservice:Expose
type Employee record {|
    readonly int id;
    @dataservice:ReadOnly {value: "OTHER"}
    Status status;
|};

enum Status {
    ACTIVE,
    ON_LEAVE
}
