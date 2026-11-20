import ballerina/dataservice;

@dataservice:Expose {scopes: {read: ["hr:read", "", "hr\tadmin"], delete: ["hr admin"]}}
type Department record {|
    readonly int id;
    string name;
|};
