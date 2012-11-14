(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for APIs Discovery Service (v1).
  
  For more information about this data model, see the
  {{:https://developers.google.com/discovery/}API Documentation}.
  *)

module JsonSchema :
sig
  module Annotations :
  sig
    type t = {
      required : string list;
      (** A list of methods for which this property is required on requests. *)
      
    }
    
    val required : (t, string list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    _ref : string;
    (** A reference to another schema. The value of this property is the "id" of another schema. *)
    additionalProperties : t option;
    (** If this is a schema for an object, this property is the schema for any additional properties with dynamic keys on this object. *)
    annotations : Annotations.t;
    (** Additional information about this property. *)
    default : string;
    (** The default value of this property (if one exists). *)
    description : string;
    (** A description of this object. *)
    enum : string list;
    (** Values this parameter may take (if it is an enum). *)
    enumDescriptions : string list;
    (** The descriptions for the enums. Each position maps to the corresponding value in the "enum" array. *)
    format : string;
    (** An additional regular expression or key that helps constrain the value. For more details see: http://tools.ietf.org/html/draft-zyp-json-schema-03#section-5.23 *)
    id : string;
    (** Unique identifier for this schema. *)
    items : t option;
    (** If this is a schema for an array, this property is the schema for each element in the array. *)
    location : string;
    (** Whether this parameter goes in the query or the path for REST requests. *)
    maximum : string;
    (** The maximum value of this parameter. *)
    minimum : string;
    (** The minimum value of this parameter. *)
    pattern : string;
    (** The regular expression this parameter must conform to. Uses Java 6 regex format: http://docs.oracle.com/javase/6/docs/api/java/util/regex/Pattern.html *)
    properties : (string * t) list;
    (** If this is a schema for an object, list the schema for each property of this object. *)
    repeated : bool;
    (** Whether this parameter may appear multiple times. *)
    required : bool;
    (** Whether the parameter is required. *)
    _type : string;
    (** The value type for this schema. A list of values can be found here: http://tools.ietf.org/html/draft-zyp-json-schema-03#section-5.1 *)
    
  }
  
  val _ref : (t, string) GapiLens.t
  val additionalProperties : (t, t option) GapiLens.t
  val annotations : (t, Annotations.t) GapiLens.t
  val default : (t, string) GapiLens.t
  val description : (t, string) GapiLens.t
  val enum : (t, string list) GapiLens.t
  val enumDescriptions : (t, string list) GapiLens.t
  val format : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val items : (t, t option) GapiLens.t
  val location : (t, string) GapiLens.t
  val maximum : (t, string) GapiLens.t
  val minimum : (t, string) GapiLens.t
  val pattern : (t, string) GapiLens.t
  val properties : (t, (string * t) list) GapiLens.t
  val repeated : (t, bool) GapiLens.t
  val required : (t, bool) GapiLens.t
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module RestMethod :
sig
  module Response :
  sig
    type t = {
      _ref : string;
      (** Schema ID for the response schema. *)
      
    }
    
    val _ref : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Request :
  sig
    type t = {
      _ref : string;
      (** Schema ID for the request schema. *)
      
    }
    
    val _ref : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module MediaUpload :
  sig
    module Protocols :
    sig
      module Simple :
      sig
        type t = {
          multipart : bool;
          (** True if this endpoint supports upload multipart media. *)
          path : string;
          (** The URI path to be used for upload. Should be used in conjunction with the basePath property at the api-level. *)
          
        }
        
        val multipart : (t, bool) GapiLens.t
        val path : (t, string) GapiLens.t
        
        val empty : t
        
        val render : t -> GapiJson.json_data_model list
        
        val parse : t -> GapiJson.json_data_model -> t
        
      end
      
      module Resumable :
      sig
        type t = {
          multipart : bool;
          (** True if this endpoint supports uploading multipart media. *)
          path : string;
          (** The URI path to be used for upload. Should be used in conjunction with the basePath property at the api-level. *)
          
        }
        
        val multipart : (t, bool) GapiLens.t
        val path : (t, string) GapiLens.t
        
        val empty : t
        
        val render : t -> GapiJson.json_data_model list
        
        val parse : t -> GapiJson.json_data_model -> t
        
      end
      
      type t = {
        resumable : Resumable.t;
        (** Supports the Resumable Media Upload protocol. *)
        simple : Simple.t;
        (** Supports uploading as a single HTTP request. *)
        
      }
      
      val resumable : (t, Resumable.t) GapiLens.t
      val simple : (t, Simple.t) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      accept : string list;
      (** MIME Media Ranges for acceptable media uploads to this method. *)
      maxSize : string;
      (** Maximum size of a media upload, such as "1MB", "2GB" or "3TB". *)
      protocols : Protocols.t;
      (** Supported upload protocols. *)
      
    }
    
    val accept : (t, string list) GapiLens.t
    val maxSize : (t, string) GapiLens.t
    val protocols : (t, Protocols.t) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    description : string;
    (** Description of this method. *)
    httpMethod : string;
    (** HTTP method used by this method. *)
    id : string;
    (** A unique ID for this method. This property can be used to match methods between different versions of Discovery. *)
    mediaUpload : MediaUpload.t;
    (** Media upload parameters. *)
    parameterOrder : string list;
    (** Ordered list of required parameters, serves as a hint to clients on how to structure their method signatures. The array is ordered such that the "most-significant" parameter appears first. *)
    parameters : (string * JsonSchema.t) list;
    (** Details for all parameters in this method. *)
    path : string;
    (** The URI path of this REST method. Should be used in conjunction with the basePath property at the api-level. *)
    request : Request.t;
    (** The schema for the request. *)
    response : Response.t;
    (** The schema for the response. *)
    scopes : string list;
    (** OAuth 2.0 scopes applicable to this method. *)
    supportsMediaDownload : bool;
    (** Whether this method supports media downloads. *)
    supportsMediaUpload : bool;
    (** Whether this method supports media uploads. *)
    supportsSubscription : bool;
    (** Whether this method supports subscriptions. *)
    
  }
  
  val description : (t, string) GapiLens.t
  val httpMethod : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val mediaUpload : (t, MediaUpload.t) GapiLens.t
  val parameterOrder : (t, string list) GapiLens.t
  val parameters : (t, (string * JsonSchema.t) list) GapiLens.t
  val path : (t, string) GapiLens.t
  val request : (t, Request.t) GapiLens.t
  val response : (t, Response.t) GapiLens.t
  val scopes : (t, string list) GapiLens.t
  val supportsMediaDownload : (t, bool) GapiLens.t
  val supportsMediaUpload : (t, bool) GapiLens.t
  val supportsSubscription : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module RestResource :
sig
  type t = {
    methods : (string * RestMethod.t) list;
    (** Methods on this resource. *)
    resources : (string * t) list;
    (** Sub-resources on this resource. *)
    
  }
  
  val methods : (t, (string * RestMethod.t) list) GapiLens.t
  val resources : (t, (string * t) list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module RestDescription :
sig
  module Icons :
  sig
    type t = {
      x16 : string;
      (** The url of the 16x16 icon. *)
      x32 : string;
      (** The url of the 32x32 icon. *)
      
    }
    
    val x16 : (t, string) GapiLens.t
    val x32 : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Auth :
  sig
    module Oauth2 :
    sig
      module Scopes :
      sig
        type t = {
          description : string;
          (** Description of scope. *)
          
        }
        
        val description : (t, string) GapiLens.t
        
        val empty : t
        
        val render : t -> GapiJson.json_data_model list
        
        val parse : t -> GapiJson.json_data_model -> t
        
      end
      
      type t = {
        scopes : (string * Scopes.t) list;
        (** Available OAuth 2.0 scopes. *)
        
      }
      
      val scopes : (t, (string * Scopes.t) list) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      oauth2 : Oauth2.t;
      (** OAuth 2.0 authentication information. *)
      
    }
    
    val oauth2 : (t, Oauth2.t) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    auth : Auth.t;
    (** Authentication information. *)
    basePath : string;
    (** [DEPRECATED] The base path for REST requests. *)
    baseUrl : string;
    (** [DEPRECATED] The base URL for REST requests. *)
    batchPath : string;
    (** The path for REST batch requests. *)
    canonicalName : string;
    (** Indicates how the API name should be capitalized and split into various parts. Useful for generating pretty class names. *)
    description : string;
    (** The description of this API. *)
    discoveryVersion : string;
    (** Indicate the version of the Discovery API used to generate this doc. *)
    documentationLink : string;
    (** A link to human readable documentation for the API. *)
    etag : string;
    (** The etag for this response. *)
    features : string list;
    (** A list of supported features for this API. *)
    icons : Icons.t;
    (** Links to 16x16 and 32x32 icons representing the API. *)
    id : string;
    (** The id of this API. *)
    kind : string;
    (** The kind for this response. *)
    labels : string list;
    (** Labels for the status of this API, such as labs or deprecated. *)
    methods : (string * RestMethod.t) list;
    (** API-level methods for this API. *)
    name : string;
    (** The name of this API. *)
    parameters : (string * JsonSchema.t) list;
    (** Common parameters that apply across all apis. *)
    protocol : string;
    (** The protocol described by this document. *)
    resources : (string * RestResource.t) list;
    (** The resources in this API. *)
    revision : string;
    (** The version of this API. *)
    rootUrl : string;
    (** The root url under which all API services live. *)
    schemas : (string * JsonSchema.t) list;
    (** The schemas for this API. *)
    servicePath : string;
    (** The base path for all REST requests. *)
    title : string;
    (** The title of this API. *)
    version : string;
    (** The version of this API. *)
    
  }
  
  val auth : (t, Auth.t) GapiLens.t
  val basePath : (t, string) GapiLens.t
  val baseUrl : (t, string) GapiLens.t
  val batchPath : (t, string) GapiLens.t
  val canonicalName : (t, string) GapiLens.t
  val description : (t, string) GapiLens.t
  val discoveryVersion : (t, string) GapiLens.t
  val documentationLink : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val features : (t, string list) GapiLens.t
  val icons : (t, Icons.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val labels : (t, string list) GapiLens.t
  val methods : (t, (string * RestMethod.t) list) GapiLens.t
  val name : (t, string) GapiLens.t
  val parameters : (t, (string * JsonSchema.t) list) GapiLens.t
  val protocol : (t, string) GapiLens.t
  val resources : (t, (string * RestResource.t) list) GapiLens.t
  val revision : (t, string) GapiLens.t
  val rootUrl : (t, string) GapiLens.t
  val schemas : (t, (string * JsonSchema.t) list) GapiLens.t
  val servicePath : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val version : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DirectoryList :
sig
  module Items :
  sig
    module Icons :
    sig
      type t = {
        x16 : string;
        (** The url of the 16x16 icon. *)
        x32 : string;
        (** The url of the 32x32 icon. *)
        
      }
      
      val x16 : (t, string) GapiLens.t
      val x32 : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      description : string;
      (** The description of this API. *)
      discoveryLink : string;
      (** A link to the discovery document. *)
      discoveryRestUrl : string;
      (** The url for the discovery REST document. *)
      documentationLink : string;
      (** A link to human readable documentation for the API. *)
      icons : Icons.t;
      (** Links to 16x16 and 32x32 icons representing the API. *)
      id : string;
      (** The id of this API. *)
      kind : string;
      (** The kind for this response. *)
      labels : string list;
      (** Labels for the status of this API, such as labs or deprecated. *)
      name : string;
      (** The name of the API. *)
      preferred : bool;
      (** True if this version is the preferred version to use. *)
      title : string;
      (** The title of this API. *)
      version : string;
      (** The version of the API. *)
      
    }
    
    val description : (t, string) GapiLens.t
    val discoveryLink : (t, string) GapiLens.t
    val discoveryRestUrl : (t, string) GapiLens.t
    val documentationLink : (t, string) GapiLens.t
    val icons : (t, Icons.t) GapiLens.t
    val id : (t, string) GapiLens.t
    val kind : (t, string) GapiLens.t
    val labels : (t, string list) GapiLens.t
    val name : (t, string) GapiLens.t
    val preferred : (t, bool) GapiLens.t
    val title : (t, string) GapiLens.t
    val version : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    discoveryVersion : string;
    (** Indicate the version of the Discovery API used to generate this doc. *)
    items : Items.t list;
    (** The individual directory entries. One entry per api/version pair. *)
    kind : string;
    (** The kind for this response. *)
    
  }
  
  val discoveryVersion : (t, string) GapiLens.t
  val items : (t, Items.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

