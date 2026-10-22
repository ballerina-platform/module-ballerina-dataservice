# Specification: Ballerina Data Service Library

_Owners_: @niveathika  
_Reviewers_:  
_Created_: 2026/10/22  
_Updated_: 2026/10/22  
_Edition_: Swan Lake

## Introduction

This is the specification for the `ballerina/dataservice` package of the [Ballerina language](https://ballerina.io/).
The package supports the data services that `bal persist` generates from a persist model, as defined in the
[data service proposal](https://github.com/ballerina-platform/ballerina-spec/issues/1503). It holds the annotation
that selects what a data service exposes, and the protocol-neutral runtime that generated services call: the error
body and codes, the mapping from persist errors to them, and the value conversions every protocol shares. Each
protocol has its own package, such as `ballerina/dataservice.http`.

The conforming implementation of the specification is released and included in the distribution. Any deviation from
the specification is considered a bug.

## Contents

* [1. The `Expose` annotation](#1-the-expose-annotation)

## 1. The `Expose` annotation

```ballerina
public enum Operation {
    READ = "read",
    CREATE = "create",
    UPDATE = "update",
    DELETE = "delete"
}

public type ExposeConfig record {|
    [Operation, Operation...] operations = [READ, CREATE, UPDATE, DELETE];
|};

public const annotation ExposeConfig Expose on source type;
```

An entity of a persist model is exposed by a data service only when its record type has the `@dataservice:Expose`
annotation. The entity then allows the actions in `operations`, which are every action by default.

| Annotation | Exposed | Actions |
|---|---|---|
| none | no | — |
| `@dataservice:Expose` | yes | `read`, `create`, `update`, `delete` |
| `@dataservice:Expose {operations: [dataservice:READ, dataservice:UPDATE]}` | yes | `read`, `update` |

Each action enables these operations:

| Action | Operations |
|---|---|
| `read` | Get many, get one |
| `create` | Create one, create many |
| `update` | Patch one |
| `delete` | Delete one |

`Expose` is a constant annotation. Its value is evaluated at compile time and is not kept at runtime. The type of
`operations` requires at least one operation, so an empty list is a compile error. An operation is written as an
`Operation` member, such as `dataservice:READ`, or as its string value, such as `"read"`.

Whether a data service is generated is decided by `options.dataservice` in the `[[tool.persist]]` entry of
`Ballerina.toml`. The annotations only select what the service exposes.
