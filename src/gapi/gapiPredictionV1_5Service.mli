(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for Prediction API (v1.5).

  Lets you access a cloud hosted machine learning service that makes it easy to build smart apps.

  For more information about this service, see the
  {{:https://developers.google.com/prediction/docs/developer-guide}API Documentation}.
  *)

module Scope :
sig
  val devstorage_full_control : string
  (** Manage your data and permissions in Google Cloud Storage *)

  val devstorage_read_only : string
  (** View your data in Google Cloud Storage *)

  val devstorage_read_write : string
  (** Manage your data in Google Cloud Storage *)

  val prediction : string
  (** Manage your data in the Google Prediction API *)


end
(** Service Auth Scopes *)

module HostedmodelsResource :
sig

  (** Submit input and request an output against a hosted model.

    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/prediction/v1.5/"]).
    @param std_params Optional standard parameters.
    @param hostedModelName The name of a hosted model.
    *)
  val predict :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    hostedModelName:string ->
    GapiPredictionV1_5Model.Input.t ->
    GapiConversation.Session.t ->
    GapiPredictionV1_5Model.Output.t * GapiConversation.Session.t


end

module TrainedmodelsResource :
sig

  (** Get analysis of the model and the data the model was trained on.

    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/prediction/v1.5/"]).
    @param std_params Optional standard parameters.
    @param id The unique name for the predictive model.
    *)
  val analyze :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    id:string ->
    GapiConversation.Session.t ->
    GapiPredictionV1_5Model.Analyze.t * GapiConversation.Session.t

  (** Delete a trained model.

    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/prediction/v1.5/"]).
    @param std_params Optional standard parameters.
    @param id The unique name for the predictive model.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    id:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t

  (** Check training status of your model.

    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/prediction/v1.5/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param id The unique name for the predictive model.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    id:string ->
    GapiConversation.Session.t ->
    GapiPredictionV1_5Model.Training.t * GapiConversation.Session.t

  (** Begin training your model.

    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/prediction/v1.5/"]).
    @param std_params Optional standard parameters.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    GapiPredictionV1_5Model.Training.t ->
    GapiConversation.Session.t ->
    GapiPredictionV1_5Model.Training.t * GapiConversation.Session.t

  (** Submit model id and request a prediction.

    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/prediction/v1.5/"]).
    @param std_params Optional standard parameters.
    @param id The unique name for the predictive model.
    *)
  val predict :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    id:string ->
    GapiPredictionV1_5Model.Input.t ->
    GapiConversation.Session.t ->
    GapiPredictionV1_5Model.Output.t * GapiConversation.Session.t

  (** Add new data to a trained model.

    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/prediction/v1.5/"]).
    @param std_params Optional standard parameters.
    @param id The unique name for the predictive model.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    id:string ->
    GapiPredictionV1_5Model.Update.t ->
    GapiConversation.Session.t ->
    GapiPredictionV1_5Model.Training.t * GapiConversation.Session.t


end
