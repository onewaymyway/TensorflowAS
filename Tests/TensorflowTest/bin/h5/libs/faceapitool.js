/**
 * ...
 * @author ww
 */

var getImgSp=async function getImgSp(img,sp) {
      const inputImgEl = img
      const { width, height } = inputImgEl
   

	  var minConfidence=0.5;
      const input = await faceapi.toNetInput(inputImgEl)
      const locations = await faceapi.locateFaces(input, minConfidence)

      const faceTensors = (await faceapi.extractFaceTensors(input, locations))
      let landmarksByFace = await Promise.all(faceTensors.map(t => faceapi.detectLandmarks(t)))

      // free memory for face image tensors after we computed their descriptors
      faceTensors.forEach(t => t.dispose())
	  
	  if(!sp) sp=new Laya.Sprite();
	  var g=sp.graphics;

      // shift and scale the face landmarks to the face image position in the canvas
      landmarksByFace = landmarksByFace.map((landmarks, i) => {
        const box = locations[i].forSize(width, height).getBox()
        return landmarks.forSize(box.width, box.height).shift(box.x, box.y)
      })

	  faceai.FaceAPI.getLandMarksSp(landmarksByFace,sp);
	  

      // free memory for input tensors
      input.dispose()
	  return sp;
    }
	
