// THIS FILE IS COPIED FROM FBTHRIFT, DO NOT MODIFY ITS CONTENTS DIRECTLY
// generated-by : fbcode/common/hs/thrift/exactprint/tests/sync-fbthrift-tests.sh
// source: thrift/compiler/test/fixtures/*
// @generated
/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

include "include.thrift"

namespace cpp apache.thrift.fixtures.types
namespace cpp2 apache.thrift.fixtures.types

typedef binary TBinary

struct decorated_struct {
  1: string field;
} (cpp.declare_hash, cpp.declare_equal_to)

struct ContainerStruct {
  12: list<i32> fieldA;
  2: list<i32> (cpp.template = "std::list") fieldB;
  3: list<i32> (cpp.template = "std::deque") fieldC;
  4: list<i32> (cpp.template = "folly::fbvector") fieldD;
  5: list<i32> (cpp.template = "folly::small_vector") fieldE;
  6: set<i32> (
    cpp.template = "folly::sorted_vector_set",
    rust.type = "sorted_vector_map::SortedVectorSet",
  ) fieldF;
  7: map<i32, string> (
    cpp.template = "folly::sorted_vector_map",
    rust.type = "sorted_vector_map::SortedVectorMap",
  ) fieldG;
  8: include.SomeMap fieldH;
}

struct CppTypeStruct {
  1: list<i32> (cpp.type = "std::list<int32_t>") fieldA;
}

enum has_bitwise_ops {
  none = 0,
  zero = 1,
  one = 2,
  two = 4,
  three = 8,
} (cpp.declare_bitwise_ops)

enum is_unscoped {
  hello = 0,
  world = 1,
} (cpp.deprecated_enum_unscoped)

service SomeService {
  include.SomeMap bounce_map(1: include.SomeMap m);
  map<TBinary, i64> binary_keyed_map(1: list<i64> r);
}

struct VirtualStruct {
  1: i64 MyIntField;
} (cpp.virtual)

struct MyStructWithForwardRefEnum {
  1: MyForwardRefEnum a = NONZERO;
  2: MyForwardRefEnum b = MyForwardRefEnum.NONZERO;
}

enum MyForwardRefEnum {
  ZERO = 0,
  NONZERO = 12,
}

struct TrivialNumeric {
  1: i32 a;
  2: bool b;
}

struct TrivialNestedWithDefault {
  1: i32 z = 4;
  2: TrivialNumeric n = {'a': 3, 'b': true};
}

struct ComplexString {
  1: string a;
  2: map<string, i32> b;
}

struct ComplexNestedWithDefault {
  1: string z = '4';
  2: ComplexString n = {'a': '3', 'b': {'a': 3}};
}

struct MinPadding {
  1: required byte small;
  2: required i64 big;
  3: required i16 medium;
  4: required i32 biggish;
  5: required byte tiny;
} (cpp.minimize_padding)

struct MyStruct {
  1: i64 MyIntField;
  2: string MyStringField;
  3: i64 majorVer;
  4: MyDataItem data;
} (cpp.noncomparable)

struct MyDataItem {
} (cpp.noncomparable)

struct Renaming {
  1: i64 foo (cpp.name = 'bar');
}

struct AnnotatedTypes {
  1: TBinary (noop_annotation) binary_field;
  2: include.SomeListOfTypeMap (noop_annotation) list_field;
}

# Validates that C++ codegen performes appropriate topological sorting of
# structs definitions in the generated code
struct ForwardUsageRoot {
  # use the type before it is defined
  1: optional ForwardUsageStruct ForwardUsageStruct;
  # use the type before it is defined, but mark it as a ref in C++
  # (no need for it to be defined before this struct in generated code)
  2: optional ForwardUsageByRef ForwardUsageByRef (cpp.ref = "true");
}

struct ForwardUsageStruct {
  1: optional ForwardUsageRoot foo;
}

struct ForwardUsageByRef {
  1: optional ForwardUsageRoot foo;
}

struct NoexceptMoveEmpty {
} (cpp.noexcept_move)

struct NoexceptMoveSimpleStruct {
  1: i64 boolField;
} (cpp.noexcept_move)

enum MyEnumA {
  fieldA = 1,
  fieldB = 2,
  fieldC = 4,
}

struct NoexceptMoveComplexStruct {
  1: bool MyBoolField;
  2: i64 MyIntField = 12;
  3: string MyStringField = "test";
  4: string MyStringField2;
  5: binary MyBinaryField;
  6: optional binary MyBinaryField2;
  7: required binary MyBinaryField3;
  8: list<binary> MyBinaryListField4;
  9: map<MyEnumA, string> MyMapEnumAndInt = {1: "fieldA", 4: "fieldC"};
} (cpp.noexcept_move)

union NoExceptMoveUnion {
  1: string string_field;
  2: i32 i32_field;
} (cpp.noexcept_move)

# Allocator-aware struct with allocator-aware fields
struct AllocatorAware {
  1: list<i32> (cpp.use_allocator) aa_list;
  2: set<i32> (cpp.use_allocator) aa_set;
  3: map<i32, i32> (cpp.use_allocator) aa_map;
  4: string (cpp.use_allocator) aa_string;
  5: i32 not_a_container;
} (cpp.allocator = "some_allocator")

# Allocator-aware struct with no allocator-aware fields
struct AllocatorAware2 {
  1: i32 not_a_container;
} (cpp.allocator = "some_allocator")

typedef i32 IntTypedef
typedef IntTypedef UintTypedef (cpp.type = "std::uint32_t")

struct TypedefStruct {
  1: i32 i32_field;
  2: IntTypedef IntTypedef_field;
  3: UintTypedef UintTypedef_field;
}

struct StructWithDoubleUnderscores {
  1: i32 __field;
}
