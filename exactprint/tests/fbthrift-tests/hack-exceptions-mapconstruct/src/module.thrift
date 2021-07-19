// THIS FILE IS COPIED FROM FBTHRIFT, DO NOT MODIFY ITS CONTENTS DIRECTLY
// generated-by : fbcode/common/hs/thrift/exactprint/tests/sync-fbthrift-tests.sh
// source: thrift/compiler/test/fixtures/*
// @generated
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

enum MyEnum {
  MyValue1 = 0,
  MyValue2 = 1,
}

exception MyException1 {
  1: string message,
  2: optional MyEnum code,
}

exception MyException2 {
  1: string message,
  2: required MyEnum code,
}

exception MyException3 {
  1: string message,
  2: MyEnum code,
}

exception MyException4 {
  1: string message,
  2: MyEnum code = MyEnum.MyValue2,
}

exception MyException5 {
  1: string message,
  2: optional i64 code,
}
