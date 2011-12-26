open OUnit
open GapiDiscovery

let test_parse_directory_list () =
  let directory_list_json =
    Json_io.load_json "test/data/test_directory_list.json" in
  let tree = GapiJson.json_to_data_model directory_list_json in
  let directory_list = DirectoryList.of_data_model tree in
  let tree' = DirectoryList.to_data_model directory_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      directory_list_json
      json

let test_parse_discovery_rest_service () =
  let discovery_service_json =
    Json_io.load_json "test/data/test_discovery_rest_service.json" in
  let tree = GapiJson.json_to_data_model discovery_service_json in
  let discovery_service = RestDescription.of_data_model tree in
  let tree' = RestDescription.to_data_model discovery_service in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      discovery_service_json
      json

let test_parse_tasks_rest_service () =
  let tasks_service_json =
    Json_io.load_json "test/data/test_tasks_rest_service.json" in
  let tree = GapiJson.json_to_data_model tasks_service_json in
  let tasks_service = RestDescription.of_data_model tree in
  let tree' = RestDescription.to_data_model tasks_service in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      tasks_service_json
      json

let test_parse_plus_rest_service () =
  let plus_service_json =
    Json_io.load_json "test/data/test_plus_rest_service.json" in
  let tree = GapiJson.json_to_data_model plus_service_json in
  let plus_service = RestDescription.of_data_model tree in
  let tree' = RestDescription.to_data_model plus_service in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      plus_service_json
      json

let test_parse_calendar_rest_service () =
  let calendar_service_json =
    Json_io.load_json "test/data/test_calendar_rest_service.json" in
  let tree = GapiJson.json_to_data_model calendar_service_json in
  let calendar_service = RestDescription.of_data_model tree in
  let tree' = RestDescription.to_data_model calendar_service in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      calendar_service_json
      json

let suite = "APIs Discovery Service Model test" >:::
  ["test_parse_directory_list" >:: test_parse_directory_list;
   "test_parse_discovery_rest_service" >:: test_parse_discovery_rest_service;
   "test_parse_tasks_rest_service" >:: test_parse_tasks_rest_service;
   "test_parse_plus_rest_service" >:: test_parse_plus_rest_service;
   "test_parse_calendar_rest_service" >:: test_parse_calendar_rest_service]

