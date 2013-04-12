(* Warning! This file is generated. Modify at your own risk. *)
open Extlib

module Update =
struct
  type t = {
    csvInstance : string list;
    label : string;
    output : string;

  }

  let csvInstance = {
    GapiLens.get = (fun x -> x.csvInstance);
    GapiLens.set = (fun v x -> { x with csvInstance = v });
  }
  let label = {
    GapiLens.get = (fun x -> x.label);
    GapiLens.set = (fun v x -> { x with label = v });
  }
  let output = {
    GapiLens.get = (fun x -> x.output);
    GapiLens.set = (fun v x -> { x with output = v });
  }

  let empty = {
    csvInstance = [];
    label = "";
    output = "";

  }

  let rec render_content x =
     [
      GapiJson.render_array "csvInstance" (GapiJson.render_string_value "") x.csvInstance;
      GapiJson.render_string_value "label" x.label;
      GapiJson.render_string_value "output" x.output;

    ]
  and render x =
    GapiJson.render_object "" (render_content x)

  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "csvInstance"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiPredictionV1_5Model.Update.parse.parse_collection" e x')
        ""
        (fun v -> { x with csvInstance = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "label"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with label = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "output"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with output = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPredictionV1_5Model.Update.parse" e x

  let to_data_model = GapiJson.render_root render

  let of_data_model = GapiJson.parse_root parse empty

end

module Training =
struct
  module TrainingInstances =
  struct
    type t = {
      csvInstance : string list;
      output : string;

    }

    let csvInstance = {
      GapiLens.get = (fun x -> x.csvInstance);
      GapiLens.set = (fun v x -> { x with csvInstance = v });
    }
    let output = {
      GapiLens.get = (fun x -> x.output);
      GapiLens.set = (fun v x -> { x with output = v });
    }

    let empty = {
      csvInstance = [];
      output = "";

    }

    let rec render_content x =
       [
        GapiJson.render_array "csvInstance" (GapiJson.render_string_value "") x.csvInstance;
        GapiJson.render_string_value "output" x.output;

      ]
    and render x =
      GapiJson.render_object "" (render_content x)

    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "csvInstance"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                `String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiPredictionV1_5Model.TrainingInstances.parse.parse_collection" e x')
          ""
          (fun v -> { x with csvInstance = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "output"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with output = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiPredictionV1_5Model.TrainingInstances.parse" e x

  end

  module ModelInfo =
  struct
    type t = {
      classWeightedAccuracy : float;
      classificationAccuracy : float;
      meanSquaredError : float;
      modelType : string;
      numberInstances : int64;
      numberLabels : int64;

    }

    let classWeightedAccuracy = {
      GapiLens.get = (fun x -> x.classWeightedAccuracy);
      GapiLens.set = (fun v x -> { x with classWeightedAccuracy = v });
    }
    let classificationAccuracy = {
      GapiLens.get = (fun x -> x.classificationAccuracy);
      GapiLens.set = (fun v x -> { x with classificationAccuracy = v });
    }
    let meanSquaredError = {
      GapiLens.get = (fun x -> x.meanSquaredError);
      GapiLens.set = (fun v x -> { x with meanSquaredError = v });
    }
    let modelType = {
      GapiLens.get = (fun x -> x.modelType);
      GapiLens.set = (fun v x -> { x with modelType = v });
    }
    let numberInstances = {
      GapiLens.get = (fun x -> x.numberInstances);
      GapiLens.set = (fun v x -> { x with numberInstances = v });
    }
    let numberLabels = {
      GapiLens.get = (fun x -> x.numberLabels);
      GapiLens.set = (fun v x -> { x with numberLabels = v });
    }

    let empty = {
      classWeightedAccuracy = 0.0;
      classificationAccuracy = 0.0;
      meanSquaredError = 0.0;
      modelType = "";
      numberInstances = 0L;
      numberLabels = 0L;

    }

    let rec render_content x =
       [
        GapiJson.render_float_value "classWeightedAccuracy" x.classWeightedAccuracy;
        GapiJson.render_float_value "classificationAccuracy" x.classificationAccuracy;
        GapiJson.render_float_value "meanSquaredError" x.meanSquaredError;
        GapiJson.render_string_value "modelType" x.modelType;
        GapiJson.render_int64_value "numberInstances" x.numberInstances;
        GapiJson.render_int64_value "numberLabels" x.numberLabels;

      ]
    and render x =
      GapiJson.render_object "" (render_content x)

    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "classWeightedAccuracy"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with classWeightedAccuracy = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "classWeightedAccuracy"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with classWeightedAccuracy = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "classificationAccuracy"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with classificationAccuracy = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "classificationAccuracy"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with classificationAccuracy = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "meanSquaredError"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with meanSquaredError = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "meanSquaredError"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with meanSquaredError = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "modelType"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with modelType = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "numberInstances"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with numberInstances = Int64.of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "numberLabels"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with numberLabels = Int64.of_string v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiPredictionV1_5Model.ModelInfo.parse" e x

  end

  type t = {
    created : GapiDate.t;
    id : string;
    kind : string;
    modelInfo : ModelInfo.t;
    modelType : string;
    selfLink : string;
    storageDataLocation : string;
    storagePMMLLocation : string;
    storagePMMLModelLocation : string;
    trainingComplete : GapiDate.t;
    trainingInstances : TrainingInstances.t list;
    trainingStatus : string;
    utility : (string * float) list list;

  }

  let created = {
    GapiLens.get = (fun x -> x.created);
    GapiLens.set = (fun v x -> { x with created = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let modelInfo = {
    GapiLens.get = (fun x -> x.modelInfo);
    GapiLens.set = (fun v x -> { x with modelInfo = v });
  }
  let modelType = {
    GapiLens.get = (fun x -> x.modelType);
    GapiLens.set = (fun v x -> { x with modelType = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let storageDataLocation = {
    GapiLens.get = (fun x -> x.storageDataLocation);
    GapiLens.set = (fun v x -> { x with storageDataLocation = v });
  }
  let storagePMMLLocation = {
    GapiLens.get = (fun x -> x.storagePMMLLocation);
    GapiLens.set = (fun v x -> { x with storagePMMLLocation = v });
  }
  let storagePMMLModelLocation = {
    GapiLens.get = (fun x -> x.storagePMMLModelLocation);
    GapiLens.set = (fun v x -> { x with storagePMMLModelLocation = v });
  }
  let trainingComplete = {
    GapiLens.get = (fun x -> x.trainingComplete);
    GapiLens.set = (fun v x -> { x with trainingComplete = v });
  }
  let trainingInstances = {
    GapiLens.get = (fun x -> x.trainingInstances);
    GapiLens.set = (fun v x -> { x with trainingInstances = v });
  }
  let trainingStatus = {
    GapiLens.get = (fun x -> x.trainingStatus);
    GapiLens.set = (fun v x -> { x with trainingStatus = v });
  }
  let utility = {
    GapiLens.get = (fun x -> x.utility);
    GapiLens.set = (fun v x -> { x with utility = v });
  }

  let empty = {
    created = GapiDate.epoch;
    id = "";
    kind = "";
    modelInfo = ModelInfo.empty;
    modelType = "";
    selfLink = "";
    storageDataLocation = "";
    storagePMMLLocation = "";
    storagePMMLModelLocation = "";
    trainingComplete = GapiDate.epoch;
    trainingInstances = [];
    trainingStatus = "";
    utility = [];

  }

  let rec render_content x =
     [
      GapiJson.render_date_value "created" x.created;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "modelInfo" (ModelInfo.render_content v)) x.modelInfo;
      GapiJson.render_string_value "modelType" x.modelType;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_string_value "storageDataLocation" x.storageDataLocation;
      GapiJson.render_string_value "storagePMMLLocation" x.storagePMMLLocation;
      GapiJson.render_string_value "storagePMMLModelLocation" x.storagePMMLModelLocation;
      GapiJson.render_date_value "trainingComplete" x.trainingComplete;
      GapiJson.render_array "trainingInstances" TrainingInstances.render x.trainingInstances;
      GapiJson.render_string_value "trainingStatus" x.trainingStatus;
      GapiJson.render_array "utility" (GapiJson.render_collection "" GapiJson.Object (fun (id, v) -> GapiJson.render_float_value id v)) x.utility;

    ]
  and render x =
    GapiJson.render_object "" (render_content x)

  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "created"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with created = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "modelInfo"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ModelInfo.parse
        ModelInfo.empty
        (fun v -> { x with modelInfo = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modelType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with modelType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "storageDataLocation"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with storageDataLocation = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "storagePMMLLocation"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with storagePMMLLocation = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "storagePMMLModelLocation"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with storagePMMLModelLocation = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "trainingComplete"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with trainingComplete = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "trainingInstances"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              TrainingInstances.parse
              TrainingInstances.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiPredictionV1_5Model.Training.parse.parse_collection" e x')
        TrainingInstances.empty
        (fun v -> { x with trainingInstances = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "trainingStatus"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with trainingStatus = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "utility"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_collection
              (fun x' -> function
                | GapiCore.AnnotatedTree.Leaf
                    ({ GapiJson.name = n; data_type = GapiJson.Scalar },
                    `Float v) ->
                  (n, v)
                | e ->
                  GapiJson.unexpected "GapiPredictionV1_5Model.Training.parse.parse_dictionary" e x')
              ("", 0.0)
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiPredictionV1_5Model.Training.parse.parse_collection" e x')
        []
        (fun v -> { x with utility = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPredictionV1_5Model.Training.parse" e x

  let to_data_model = GapiJson.render_root render

  let of_data_model = GapiJson.parse_root parse empty

end

module Input =
struct
  module Input =
  struct
    type t = {
      csvInstance : string list;

    }

    let csvInstance = {
      GapiLens.get = (fun x -> x.csvInstance);
      GapiLens.set = (fun v x -> { x with csvInstance = v });
    }

    let empty = {
      csvInstance = [];

    }

    let rec render_content x =
       [
        GapiJson.render_array "csvInstance" (GapiJson.render_string_value "") x.csvInstance;

      ]
    and render x =
      GapiJson.render_object "" (render_content x)

    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "csvInstance"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                `String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiPredictionV1_5Model.Input.parse.parse_collection" e x')
          ""
          (fun v -> { x with csvInstance = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiPredictionV1_5Model.Input.parse" e x

  end

  type t = {
    input : Input.t;

  }

  let input = {
    GapiLens.get = (fun x -> x.input);
    GapiLens.set = (fun v x -> { x with input = v });
  }

  let empty = {
    input = Input.empty;

  }

  let rec render_content x =
     [
      (fun v -> GapiJson.render_object "input" (Input.render_content v)) x.input;

    ]
  and render x =
    GapiJson.render_object "" (render_content x)

  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "input"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Input.parse
        Input.empty
        (fun v -> { x with input = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPredictionV1_5Model.Input.parse" e x

  let to_data_model = GapiJson.render_root render

  let of_data_model = GapiJson.parse_root parse empty

end

module Output =
struct
  module OutputMulti =
  struct
    type t = {
      label : string;
      score : float;

    }

    let label = {
      GapiLens.get = (fun x -> x.label);
      GapiLens.set = (fun v x -> { x with label = v });
    }
    let score = {
      GapiLens.get = (fun x -> x.score);
      GapiLens.set = (fun v x -> { x with score = v });
    }

    let empty = {
      label = "";
      score = 0.0;

    }

    let rec render_content x =
       [
        GapiJson.render_string_value "label" x.label;
        GapiJson.render_float_value "score" x.score;

      ]
    and render x =
      GapiJson.render_object "" (render_content x)

    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "label"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with label = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "score"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with score = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "score"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with score = float_of_int v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiPredictionV1_5Model.OutputMulti.parse" e x

  end

  type t = {
    id : string;
    kind : string;
    outputLabel : string;
    outputMulti : OutputMulti.t list;
    outputValue : float;
    selfLink : string;

  }

  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let outputLabel = {
    GapiLens.get = (fun x -> x.outputLabel);
    GapiLens.set = (fun v x -> { x with outputLabel = v });
  }
  let outputMulti = {
    GapiLens.get = (fun x -> x.outputMulti);
    GapiLens.set = (fun v x -> { x with outputMulti = v });
  }
  let outputValue = {
    GapiLens.get = (fun x -> x.outputValue);
    GapiLens.set = (fun v x -> { x with outputValue = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }

  let empty = {
    id = "";
    kind = "";
    outputLabel = "";
    outputMulti = [];
    outputValue = 0.0;
    selfLink = "";

  }

  let rec render_content x =
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "outputLabel" x.outputLabel;
      GapiJson.render_array "outputMulti" OutputMulti.render x.outputMulti;
      GapiJson.render_float_value "outputValue" x.outputValue;
      GapiJson.render_string_value "selfLink" x.selfLink;

    ]
  and render x =
    GapiJson.render_object "" (render_content x)

  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "outputLabel"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with outputLabel = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "outputMulti"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              OutputMulti.parse
              OutputMulti.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiPredictionV1_5Model.Output.parse.parse_collection" e x')
        OutputMulti.empty
        (fun v -> { x with outputMulti = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "outputValue"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with outputValue = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "outputValue"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with outputValue = float_of_int v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPredictionV1_5Model.Output.parse" e x

  let to_data_model = GapiJson.render_root render

  let of_data_model = GapiJson.parse_root parse empty

end

module Analyze =
struct
  module ModelDescription =
  struct
    type t = {
      confusionMatrix : (string * (string * float) list) list;
      confusionMatrixRowTotals : (string * float) list;
      modelinfo : Training.t;

    }

    let confusionMatrix = {
      GapiLens.get = (fun x -> x.confusionMatrix);
      GapiLens.set = (fun v x -> { x with confusionMatrix = v });
    }
    let confusionMatrixRowTotals = {
      GapiLens.get = (fun x -> x.confusionMatrixRowTotals);
      GapiLens.set = (fun v x -> { x with confusionMatrixRowTotals = v });
    }
    let modelinfo = {
      GapiLens.get = (fun x -> x.modelinfo);
      GapiLens.set = (fun v x -> { x with modelinfo = v });
    }

    let empty = {
      confusionMatrix = [];
      confusionMatrixRowTotals = [];
      modelinfo = Training.empty;

    }

    let rec render_content x =
       [
        GapiJson.render_collection "confusionMatrix" GapiJson.Object (fun (id, v) -> GapiJson.render_collection id GapiJson.Object (fun (id, v) -> GapiJson.render_float_value id v) v) x.confusionMatrix;
        GapiJson.render_collection "confusionMatrixRowTotals" GapiJson.Object (fun (id, v) -> GapiJson.render_float_value id v) x.confusionMatrixRowTotals;
        (fun v -> GapiJson.render_object "modelinfo" (Training.render_content v)) x.modelinfo;

      ]
    and render x =
      GapiJson.render_object "" (render_content x)

    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "confusionMatrix"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = n; data_type = GapiJson.Object },
                cs) ->
              GapiJson.parse_collection
                (fun x' -> function
                  | GapiCore.AnnotatedTree.Leaf
                      ({ GapiJson.name = n; data_type = GapiJson.Scalar },
                      `Float v) ->
                    (n, v)
                  | e ->
                    GapiJson.unexpected "GapiPredictionV1_5Model.ModelDescription.parse.parse_dictionary" e x')
                ("", 0.0)
                (fun v -> (n, v))
                cs
            | e ->
              GapiJson.unexpected "GapiPredictionV1_5Model.ModelDescription.parse.parse_dictionary" e x')
          ("", [])
          (fun v -> { x with confusionMatrix = v })
          cs
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "confusionMatrixRowTotals"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = n; data_type = GapiJson.Scalar },
                `Float v) ->
              (n, v)
            | e ->
              GapiJson.unexpected "GapiPredictionV1_5Model.ModelDescription.parse.parse_dictionary" e x')
          ("", 0.0)
          (fun v -> { x with confusionMatrixRowTotals = v })
          cs
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "modelinfo"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          Training.parse
          Training.empty
          (fun v -> { x with modelinfo = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiPredictionV1_5Model.ModelDescription.parse" e x

  end

  module DataDescription =
  struct
    module OutputFeature =
    struct
      module Text =
      struct
        type t = {
          count : int64;
          value : string;

        }

        let count = {
          GapiLens.get = (fun x -> x.count);
          GapiLens.set = (fun v x -> { x with count = v });
        }
        let value = {
          GapiLens.get = (fun x -> x.value);
          GapiLens.set = (fun v x -> { x with value = v });
        }

        let empty = {
          count = 0L;
          value = "";

        }

        let rec render_content x =
           [
            GapiJson.render_int64_value "count" x.count;
            GapiJson.render_string_value "value" x.value;

          ]
        and render x =
          GapiJson.render_object "" (render_content x)

        let rec parse x = function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "count"; data_type = GapiJson.Scalar },
              `String v) ->
            { x with count = Int64.of_string v }
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
              `String v) ->
            { x with value = v }
          | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = ""; data_type = GapiJson.Object },
            cs) ->
            GapiJson.parse_children parse empty (fun x -> x) cs
          | e ->
            GapiJson.unexpected "GapiPredictionV1_5Model.Text.parse" e x

      end

      module Numeric =
      struct
        type t = {
          count : int64;
          mean : float;
          variance : float;

        }

        let count = {
          GapiLens.get = (fun x -> x.count);
          GapiLens.set = (fun v x -> { x with count = v });
        }
        let mean = {
          GapiLens.get = (fun x -> x.mean);
          GapiLens.set = (fun v x -> { x with mean = v });
        }
        let variance = {
          GapiLens.get = (fun x -> x.variance);
          GapiLens.set = (fun v x -> { x with variance = v });
        }

        let empty = {
          count = 0L;
          mean = 0.0;
          variance = 0.0;

        }

        let rec render_content x =
           [
            GapiJson.render_int64_value "count" x.count;
            GapiJson.render_float_value "mean" x.mean;
            GapiJson.render_float_value "variance" x.variance;

          ]
        and render x =
          GapiJson.render_object "" (render_content x)

        let rec parse x = function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "count"; data_type = GapiJson.Scalar },
              `String v) ->
            { x with count = Int64.of_string v }
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "mean"; data_type = GapiJson.Scalar },
              `Float v) ->
            { x with mean = v }
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "mean"; data_type = GapiJson.Scalar },
              `Int v) ->
            { x with mean = float_of_int v }
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "variance"; data_type = GapiJson.Scalar },
              `Float v) ->
            { x with variance = v }
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "variance"; data_type = GapiJson.Scalar },
              `Int v) ->
            { x with variance = float_of_int v }
          | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = ""; data_type = GapiJson.Object },
            cs) ->
            GapiJson.parse_children parse empty (fun x -> x) cs
          | e ->
            GapiJson.unexpected "GapiPredictionV1_5Model.Numeric.parse" e x

      end

      type t = {
        numeric : Numeric.t;
        text : Text.t list;

      }

      let numeric = {
        GapiLens.get = (fun x -> x.numeric);
        GapiLens.set = (fun v x -> { x with numeric = v });
      }
      let text = {
        GapiLens.get = (fun x -> x.text);
        GapiLens.set = (fun v x -> { x with text = v });
      }

      let empty = {
        numeric = Numeric.empty;
        text = [];

      }

      let rec render_content x =
         [
          (fun v -> GapiJson.render_object "numeric" (Numeric.render_content v)) x.numeric;
          GapiJson.render_array "text" Text.render x.text;

        ]
      and render x =
        GapiJson.render_object "" (render_content x)

      let rec parse x = function
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "numeric"; data_type = GapiJson.Object },
            cs) ->
          GapiJson.parse_children
            Numeric.parse
            Numeric.empty
            (fun v -> { x with numeric = v })
            cs
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "text"; data_type = GapiJson.Array },
            cs) ->
          GapiJson.parse_collection
            (fun x' -> function
              | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = ""; data_type = GapiJson.Object },
                  cs) ->
                GapiJson.parse_children Text.parse Text.empty (fun v -> v) cs
              | e ->
                GapiJson.unexpected "GapiPredictionV1_5Model.OutputFeature.parse.parse_collection" e x')
            Text.empty
            (fun v -> { x with text = v })
            cs
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiPredictionV1_5Model.OutputFeature.parse" e x

    end

    module Features =
    struct
      module Text =
      struct
        type t = {
          count : int64;

        }

        let count = {
          GapiLens.get = (fun x -> x.count);
          GapiLens.set = (fun v x -> { x with count = v });
        }

        let empty = {
          count = 0L;

        }

        let rec render_content x =
           [
            GapiJson.render_int64_value "count" x.count;

          ]
        and render x =
          GapiJson.render_object "" (render_content x)

        let rec parse x = function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "count"; data_type = GapiJson.Scalar },
              `String v) ->
            { x with count = Int64.of_string v }
          | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = ""; data_type = GapiJson.Object },
            cs) ->
            GapiJson.parse_children parse empty (fun x -> x) cs
          | e ->
            GapiJson.unexpected "GapiPredictionV1_5Model.Text.parse" e x

      end

      module Numeric =
      struct
        type t = {
          count : int64;
          mean : float;
          variance : float;

        }

        let count = {
          GapiLens.get = (fun x -> x.count);
          GapiLens.set = (fun v x -> { x with count = v });
        }
        let mean = {
          GapiLens.get = (fun x -> x.mean);
          GapiLens.set = (fun v x -> { x with mean = v });
        }
        let variance = {
          GapiLens.get = (fun x -> x.variance);
          GapiLens.set = (fun v x -> { x with variance = v });
        }

        let empty = {
          count = 0L;
          mean = 0.0;
          variance = 0.0;

        }

        let rec render_content x =
           [
            GapiJson.render_int64_value "count" x.count;
            GapiJson.render_float_value "mean" x.mean;
            GapiJson.render_float_value "variance" x.variance;

          ]
        and render x =
          GapiJson.render_object "" (render_content x)

        let rec parse x = function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "count"; data_type = GapiJson.Scalar },
              `String v) ->
            { x with count = Int64.of_string v }
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "mean"; data_type = GapiJson.Scalar },
              `Float v) ->
            { x with mean = v }
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "mean"; data_type = GapiJson.Scalar },
              `Int v) ->
            { x with mean = float_of_int v }
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "variance"; data_type = GapiJson.Scalar },
              `Float v) ->
            { x with variance = v }
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "variance"; data_type = GapiJson.Scalar },
              `Int v) ->
            { x with variance = float_of_int v }
          | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = ""; data_type = GapiJson.Object },
            cs) ->
            GapiJson.parse_children parse empty (fun x -> x) cs
          | e ->
            GapiJson.unexpected "GapiPredictionV1_5Model.Numeric.parse" e x

      end

      module Categorical =
      struct
        module Values =
        struct
          type t = {
            count : int64;
            value : string;

          }

          let count = {
            GapiLens.get = (fun x -> x.count);
            GapiLens.set = (fun v x -> { x with count = v });
          }
          let value = {
            GapiLens.get = (fun x -> x.value);
            GapiLens.set = (fun v x -> { x with value = v });
          }

          let empty = {
            count = 0L;
            value = "";

          }

          let rec render_content x =
             [
              GapiJson.render_int64_value "count" x.count;
              GapiJson.render_string_value "value" x.value;

            ]
          and render x =
            GapiJson.render_object "" (render_content x)

          let rec parse x = function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = "count"; data_type = GapiJson.Scalar },
                `String v) ->
              { x with count = Int64.of_string v }
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
                `String v) ->
              { x with value = v }
            | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
              GapiJson.parse_children parse empty (fun x -> x) cs
            | e ->
              GapiJson.unexpected "GapiPredictionV1_5Model.Values.parse" e x

        end

        type t = {
          count : int64;
          values : Values.t list;

        }

        let count = {
          GapiLens.get = (fun x -> x.count);
          GapiLens.set = (fun v x -> { x with count = v });
        }
        let values = {
          GapiLens.get = (fun x -> x.values);
          GapiLens.set = (fun v x -> { x with values = v });
        }

        let empty = {
          count = 0L;
          values = [];

        }

        let rec render_content x =
           [
            GapiJson.render_int64_value "count" x.count;
            GapiJson.render_array "values" Values.render x.values;

          ]
        and render x =
          GapiJson.render_object "" (render_content x)

        let rec parse x = function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "count"; data_type = GapiJson.Scalar },
              `String v) ->
            { x with count = Int64.of_string v }
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = "values"; data_type = GapiJson.Array },
              cs) ->
            GapiJson.parse_collection
              (fun x' -> function
                | GapiCore.AnnotatedTree.Node
                    ({ GapiJson.name = ""; data_type = GapiJson.Object },
                    cs) ->
                  GapiJson.parse_children
                    Values.parse
                    Values.empty
                    (fun v -> v)
                    cs
                | e ->
                  GapiJson.unexpected "GapiPredictionV1_5Model.Categorical.parse.parse_collection" e x')
              Values.empty
              (fun v -> { x with values = v })
              cs
          | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = ""; data_type = GapiJson.Object },
            cs) ->
            GapiJson.parse_children parse empty (fun x -> x) cs
          | e ->
            GapiJson.unexpected "GapiPredictionV1_5Model.Categorical.parse" e x

      end

      type t = {
        categorical : Categorical.t;
        index : int64;
        numeric : Numeric.t;
        text : Text.t;

      }

      let categorical = {
        GapiLens.get = (fun x -> x.categorical);
        GapiLens.set = (fun v x -> { x with categorical = v });
      }
      let index = {
        GapiLens.get = (fun x -> x.index);
        GapiLens.set = (fun v x -> { x with index = v });
      }
      let numeric = {
        GapiLens.get = (fun x -> x.numeric);
        GapiLens.set = (fun v x -> { x with numeric = v });
      }
      let text = {
        GapiLens.get = (fun x -> x.text);
        GapiLens.set = (fun v x -> { x with text = v });
      }

      let empty = {
        categorical = Categorical.empty;
        index = 0L;
        numeric = Numeric.empty;
        text = Text.empty;

      }

      let rec render_content x =
         [
          (fun v -> GapiJson.render_object "categorical" (Categorical.render_content v)) x.categorical;
          GapiJson.render_int64_value "index" x.index;
          (fun v -> GapiJson.render_object "numeric" (Numeric.render_content v)) x.numeric;
          (fun v -> GapiJson.render_object "text" (Text.render_content v)) x.text;

        ]
      and render x =
        GapiJson.render_object "" (render_content x)

      let rec parse x = function
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "categorical"; data_type = GapiJson.Object },
            cs) ->
          GapiJson.parse_children
            Categorical.parse
            Categorical.empty
            (fun v -> { x with categorical = v })
            cs
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "index"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with index = Int64.of_string v }
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "numeric"; data_type = GapiJson.Object },
            cs) ->
          GapiJson.parse_children
            Numeric.parse
            Numeric.empty
            (fun v -> { x with numeric = v })
            cs
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "text"; data_type = GapiJson.Object },
            cs) ->
          GapiJson.parse_children
            Text.parse
            Text.empty
            (fun v -> { x with text = v })
            cs
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiPredictionV1_5Model.Features.parse" e x

    end

    type t = {
      features : Features.t list;
      outputFeature : OutputFeature.t;

    }

    let features = {
      GapiLens.get = (fun x -> x.features);
      GapiLens.set = (fun v x -> { x with features = v });
    }
    let outputFeature = {
      GapiLens.get = (fun x -> x.outputFeature);
      GapiLens.set = (fun v x -> { x with outputFeature = v });
    }

    let empty = {
      features = [];
      outputFeature = OutputFeature.empty;

    }

    let rec render_content x =
       [
        GapiJson.render_array "features" Features.render x.features;
        (fun v -> GapiJson.render_object "outputFeature" (OutputFeature.render_content v)) x.outputFeature;

      ]
    and render x =
      GapiJson.render_object "" (render_content x)

    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "features"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = ""; data_type = GapiJson.Object },
                cs) ->
              GapiJson.parse_children
                Features.parse
                Features.empty
                (fun v -> v)
                cs
            | e ->
              GapiJson.unexpected "GapiPredictionV1_5Model.DataDescription.parse.parse_collection" e x')
          Features.empty
          (fun v -> { x with features = v })
          cs
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "outputFeature"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          OutputFeature.parse
          OutputFeature.empty
          (fun v -> { x with outputFeature = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiPredictionV1_5Model.DataDescription.parse" e x

  end

  type t = {
    dataDescription : DataDescription.t;
    errors : (string * string) list list;
    id : string;
    kind : string;
    modelDescription : ModelDescription.t;
    selfLink : string;

  }

  let dataDescription = {
    GapiLens.get = (fun x -> x.dataDescription);
    GapiLens.set = (fun v x -> { x with dataDescription = v });
  }
  let errors = {
    GapiLens.get = (fun x -> x.errors);
    GapiLens.set = (fun v x -> { x with errors = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let modelDescription = {
    GapiLens.get = (fun x -> x.modelDescription);
    GapiLens.set = (fun v x -> { x with modelDescription = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }

  let empty = {
    dataDescription = DataDescription.empty;
    errors = [];
    id = "";
    kind = "";
    modelDescription = ModelDescription.empty;
    selfLink = "";

  }

  let rec render_content x =
     [
      (fun v -> GapiJson.render_object "dataDescription" (DataDescription.render_content v)) x.dataDescription;
      GapiJson.render_array "errors" (GapiJson.render_collection "" GapiJson.Object (fun (id, v) -> GapiJson.render_string_value id v)) x.errors;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "modelDescription" (ModelDescription.render_content v)) x.modelDescription;
      GapiJson.render_string_value "selfLink" x.selfLink;

    ]
  and render x =
    GapiJson.render_object "" (render_content x)

  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataDescription"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataDescription.parse
        DataDescription.empty
        (fun v -> { x with dataDescription = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "errors"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_collection
              (fun x' -> function
                | GapiCore.AnnotatedTree.Leaf
                    ({ GapiJson.name = n; data_type = GapiJson.Scalar },
                    `String v) ->
                  (n, v)
                | e ->
                  GapiJson.unexpected "GapiPredictionV1_5Model.Analyze.parse.parse_dictionary" e x')
              ("", "")
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiPredictionV1_5Model.Analyze.parse.parse_collection" e x')
        []
        (fun v -> { x with errors = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "modelDescription"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ModelDescription.parse
        ModelDescription.empty
        (fun v -> { x with modelDescription = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPredictionV1_5Model.Analyze.parse" e x

  let to_data_model = GapiJson.render_root render

  let of_data_model = GapiJson.parse_root parse empty

end
