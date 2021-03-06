/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

grammar DCLStatement;

import Symbol, Keyword, SQL92Keyword, Literals, BaseRule;

grant
    : GRANT privilegeClause_ TO grantee_ (COMMA_ grantee_)* (WITH GRANT OPTION)?
    ;

revoke
    : REVOKE (GRANT OPTION FOR)? privilegeClause_ FROM grantee_ (COMMA_ grantee_)* dropBehaviour_
    ;  

privilegeClause_
    : privileges_ ON onObjectClause_
    ;

privileges_
    : privilegeType_ columnNames
    ;

privilegeType_
    : ALL PRIVILEGES
    | SELECT
    | DELETE
    | INSERT
    | UPDATE
    | REFERENCES
    | USAGE
    ;

grantee_
    : PUBLIC | identifier_
    ;

onObjectClause_
    : objectType_? privilegeLevel_
    ;

objectType_
    : TABLE
    ;

privilegeLevel_
    : tableName
    ;
