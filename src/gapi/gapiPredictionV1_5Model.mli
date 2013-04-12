(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for Prediction API (v1.5).

  For more information about this data model, see the
  {{:https://developers.google.com/prediction/docs/developer-guide}API Documentation}.
  *)

module Update :
sig
  type t = {
    csvInstance : string list;
    (** The input features for this instance *)
    label : string;
    (** The class label of this instance *)
    output : string;
    (** The generic output value - could be regression value or class label *)

  }

  val csvInstance : (t, string list) GapiLens.t
  val label : (t, string) GapiLens.t
  val output : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module Training :
sig
  module TrainingInstances :
  sig
    type t = {
      csvInstance : string list;
      (** The input features for this instance *)
      output : string;
      (** The generic output value - could be regression or class label *)

    }

    val csvInstance : (t, string list) GapiLens.t
    val output : (t, string) GapiLens.t

    val empty : t

    val render : t -> GapiJson.json_data_model list

    val parse : t -> GapiJson.json_data_model -> t

  end

  module ModelInfo :
  sig
    type t = {
      classWeightedAccuracy : float;
      (** Estimated accuracy of model taking utility weights into account [Categorical models only]. *)
      classificationAccuracy : float;
      (** A number between 0.0 and 1.0, where 1.0 is 100% accurate. This is an estimate, based on the amount and quality of the training data, of the estimated prediction accuracy. You can use this is a guide to decide whether the results are accurate enough for your needs. This estimate will be more reliable if your real input data is similar to your training data [Categorical models only]. *)
      meanSquaredError : float;
      (** An estimated mean squared error. The can be used to measure the quality of the predicted model [Regression models only]. *)
      modelType : string;
      (** Type of predictive model (CLASSIFICATION or REGRESSION) *)
      numberInstances : int64;
      (** Number of valid data instances used in the trained model. *)
      numberLabels : int64;
      (** Number of class labels in the trained model [Categorical models only]. *)

    }

    val classWeightedAccuracy : (t, float) GapiLens.t
    val classificationAccuracy : (t, float) GapiLens.t
    val meanSquaredError : (t, float) GapiLens.t
    val modelType : (t, string) GapiLens.t
    val numberInstances : (t, int64) GapiLens.t
    val numberLabels : (t, int64) GapiLens.t

    val empty : t

    val render : t -> GapiJson.json_data_model list

    val parse : t -> GapiJson.json_data_model -> t

  end

  type t = {
    created : GapiDate.t;
    (** Insert time of the model (as a RFC 3339 timestamp). *)
    id : string;
    (** The unique name for the predictive model. *)
    kind : string;
    (** What kind of resource this is. *)
    modelInfo : ModelInfo.t;
    (** Model metadata. *)
    modelType : string;
    (** Type of predictive model (classification or regression) *)
    selfLink : string;
    (** A URL to re-request this resource. *)
    storageDataLocation : string;
    (** Google storage location of the training data file. *)
    storagePMMLLocation : string;
    (** Google storage location of the preprocessing pmml file. *)
    storagePMMLModelLocation : string;
    (** Google storage location of the pmml model file. *)
    trainingComplete : GapiDate.t;
    (** Training completion time (as a RFC 3339 timestamp). *)
    trainingInstances : TrainingInstances.t list;
    (** Instances to train model on. *)
    trainingStatus : string;
    (** The current status of the training job. This can be one of following: RUNNING; DONE; ERROR; ERROR: TRAINING JOB NOT FOUND *)
    utility : (string * float) list list;
    (** A class weighting function, which allows the importance weights for class labels to be specified [Categorical models only]. *)

  }

  val created : (t, GapiDate.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val modelInfo : (t, ModelInfo.t) GapiLens.t
  val modelType : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val storageDataLocation : (t, string) GapiLens.t
  val storagePMMLLocation : (t, string) GapiLens.t
  val storagePMMLModelLocation : (t, string) GapiLens.t
  val trainingComplete : (t, GapiDate.t) GapiLens.t
  val trainingInstances : (t, TrainingInstances.t list) GapiLens.t
  val trainingStatus : (t, string) GapiLens.t
  val utility : (t, (string * float) list list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module Input :
sig
  module Input :
  sig
    type t = {
      csvInstance : string list;
      (** A list of input features, these can be strings or doubles. *)

    }

    val csvInstance : (t, string list) GapiLens.t

    val empty : t

    val render : t -> GapiJson.json_data_model list

    val parse : t -> GapiJson.json_data_model -> t

  end

  type t = {
    input : Input.t;
    (** Input to the model for a prediction *)

  }

  val input : (t, Input.t) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module Output :
sig
  module OutputMulti :
  sig
    type t = {
      label : string;
      (** The class label. *)
      score : float;
      (** The probability of the class label. *)

    }

    val label : (t, string) GapiLens.t
    val score : (t, float) GapiLens.t

    val empty : t

    val render : t -> GapiJson.json_data_model list

    val parse : t -> GapiJson.json_data_model -> t

  end

  type t = {
    id : string;
    (** The unique name for the predictive model. *)
    kind : string;
    (** What kind of resource this is. *)
    outputLabel : string;
    (** The most likely class label [Categorical models only]. *)
    outputMulti : OutputMulti.t list;
    (** A list of class labels with their estimated probabilities [Categorical models only]. *)
    outputValue : float;
    (** The estimated regression value [Regression models only]. *)
    selfLink : string;
    (** A URL to re-request this resource. *)

  }

  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val outputLabel : (t, string) GapiLens.t
  val outputMulti : (t, OutputMulti.t list) GapiLens.t
  val outputValue : (t, float) GapiLens.t
  val selfLink : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module Analyze :
sig
  module ModelDescription :
  sig
    type t = {
      confusionMatrix : (string * (string * float) list) list;
      (** An output confusion matrix. This shows an estimate for how this model will do in predictions. This is first indexed by the true class label. For each true class label, this provides a pair {predicted_label, count}, where count is the estimated number of times the model will predict the predicted label given the true label. Will not output if more then 100 classes [Categorical models only]. *)
      confusionMatrixRowTotals : (string * float) list;
      (** A list of the confusion matrix row totals *)
      modelinfo : Training.t;
      (** Basic information about the model. *)

    }

    val confusionMatrix : (t, (string * (string * float) list) list) GapiLens.t
    val confusionMatrixRowTotals : (t, (string * float) list) GapiLens.t
    val modelinfo : (t, Training.t) GapiLens.t

    val empty : t

    val render : t -> GapiJson.json_data_model list

    val parse : t -> GapiJson.json_data_model -> t

  end

  module DataDescription :
  sig
    module OutputFeature :
    sig
      module Text :
      sig
        type t = {
          count : int64;
          (** Number of times the output label occurred in the data set. *)
          value : string;
          (** The output label. *)

        }

        val count : (t, int64) GapiLens.t
        val value : (t, string) GapiLens.t

        val empty : t

        val render : t -> GapiJson.json_data_model list

        val parse : t -> GapiJson.json_data_model -> t

      end

      module Numeric :
      sig
        type t = {
          count : int64;
          (** Number of numeric output values in the data set. *)
          mean : float;
          (** Mean of the output values in the data set. *)
          variance : float;
          (** Variance of the output values in the data set. *)

        }

        val count : (t, int64) GapiLens.t
        val mean : (t, float) GapiLens.t
        val variance : (t, float) GapiLens.t

        val empty : t

        val render : t -> GapiJson.json_data_model list

        val parse : t -> GapiJson.json_data_model -> t

      end

      type t = {
        numeric : Numeric.t;
        (** Description of the output values in the data set. *)
        text : Text.t list;
        (** Description of the output labels in the data set. *)

      }

      val numeric : (t, Numeric.t) GapiLens.t
      val text : (t, Text.t list) GapiLens.t

      val empty : t

      val render : t -> GapiJson.json_data_model list

      val parse : t -> GapiJson.json_data_model -> t

    end

    module Features :
    sig
      module Text :
      sig
        type t = {
          count : int64;
          (** Number of multiple-word text values for this feature. *)

        }

        val count : (t, int64) GapiLens.t

        val empty : t

        val render : t -> GapiJson.json_data_model list

        val parse : t -> GapiJson.json_data_model -> t

      end

      module Numeric :
      sig
        type t = {
          count : int64;
          (** Number of numeric values for this feature in the data set. *)
          mean : float;
          (** Mean of the numeric values of this feature in the data set. *)
          variance : float;
          (** Variance of the numeric values of this feature in the data set. *)

        }

        val count : (t, int64) GapiLens.t
        val mean : (t, float) GapiLens.t
        val variance : (t, float) GapiLens.t

        val empty : t

        val render : t -> GapiJson.json_data_model list

        val parse : t -> GapiJson.json_data_model -> t

      end

      module Categorical :
      sig
        module Values :
        sig
          type t = {
            count : int64;
            (** Number of times this feature had this value. *)
            value : string;
            (** The category name. *)

          }

          val count : (t, int64) GapiLens.t
          val value : (t, string) GapiLens.t

          val empty : t

          val render : t -> GapiJson.json_data_model list

          val parse : t -> GapiJson.json_data_model -> t

        end

        type t = {
          count : int64;
          (** Number of categorical values for this feature in the data. *)
          values : Values.t list;
          (** List of all the categories for this feature in the data set. *)

        }

        val count : (t, int64) GapiLens.t
        val values : (t, Values.t list) GapiLens.t

        val empty : t

        val render : t -> GapiJson.json_data_model list

        val parse : t -> GapiJson.json_data_model -> t

      end

      type t = {
        categorical : Categorical.t;
        (** Description of the categorical values of this feature. *)
        index : int64;
        (** The feature index. *)
        numeric : Numeric.t;
        (** Description of the numeric values of this feature. *)
        text : Text.t;
        (** Description of multiple-word text values of this feature. *)

      }

      val categorical : (t, Categorical.t) GapiLens.t
      val index : (t, int64) GapiLens.t
      val numeric : (t, Numeric.t) GapiLens.t
      val text : (t, Text.t) GapiLens.t

      val empty : t

      val render : t -> GapiJson.json_data_model list

      val parse : t -> GapiJson.json_data_model -> t

    end

    type t = {
      features : Features.t list;
      (** Description of the input features in the data set. *)
      outputFeature : OutputFeature.t;
      (** Description of the output value or label. *)

    }

    val features : (t, Features.t list) GapiLens.t
    val outputFeature : (t, OutputFeature.t) GapiLens.t

    val empty : t

    val render : t -> GapiJson.json_data_model list

    val parse : t -> GapiJson.json_data_model -> t

  end

  type t = {
    dataDescription : DataDescription.t;
    (** Description of the data the model was trained on. *)
    errors : (string * string) list list;
    (** List of errors with the data. *)
    id : string;
    (** The unique name for the predictive model. *)
    kind : string;
    (** What kind of resource this is. *)
    modelDescription : ModelDescription.t;
    (** Description of the model. *)
    selfLink : string;
    (** A URL to re-request this resource. *)

  }

  val dataDescription : (t, DataDescription.t) GapiLens.t
  val errors : (t, (string * string) list list) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val modelDescription : (t, ModelDescription.t) GapiLens.t
  val selfLink : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end
