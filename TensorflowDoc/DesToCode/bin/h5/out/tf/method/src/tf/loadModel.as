/*[IF-FLASH]*/
package tf
{

	import Promise;

	/**
	 * loadModel
	 * @param pathOrIOHandler (string|io.IOHandler) Can be either of the two formats A string path to the ModelAndWeightsConfig JSON describing
              the model in the canonical TensorFlow.js format. This path will be
              interpreted as a relative HTTP path, to which fetch will be used to
              request the model topology and weight manifest JSON.
              The content of the JSON file is assumed to be a JSON object with the
              following fields and values: 'modelTopology': A JSON object that can be either of: a model architecture JSON consistent with the format of the return
              value of keras.Model.to_json() a full model JSON in the format of keras.models.save_model() . 'weightsManifest': A TensorFlow.js weights manifest.
              See the Python converter function save_model() for more details.
              It is also assumed that model weights can be accessed from relative
              paths described by the paths fields in weights manifest. An tf.io.IOHandler object that loads model artifacts with its load method.
	 * @param strict (boolean) Require that the provided weights exactly match those required
              by the layers.  Default true.  Passing false means that both extra weights
              and missing weights will be silently ignored.
	 * @return Promise
	 */
	public function loadModel(pathOrIOHandler:*=null,strict:*=null):Promise
	{
		return null;
	}


}