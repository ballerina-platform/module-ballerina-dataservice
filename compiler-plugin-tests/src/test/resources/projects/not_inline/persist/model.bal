import ballerina/dataservice;
import ballerina/persist as _;

const OPERATIONS = [dataservice:READ];
const ADMIN = "hr:admin";

@dataservice:Expose {operations: OPERATIONS, scopes: {read: [ADMIN]}}
type Department record {|
    readonly int id;
|};
