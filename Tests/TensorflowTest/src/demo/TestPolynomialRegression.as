package demo {
	import tf.randomNormal;
	import tf.randomUniform;
	import tf.scalar;
	import tf.Scalar;
	import tf.Tensor;
	import tf.tidy;
	import tf.train.Optimizer;
	import tf.train.sgd;
	import tf.variable;
	import tf.Variable;
	
	/**
	 * ...
	 * @author ww
	 */
	public class TestPolynomialRegression {
		
		public function TestPolynomialRegression() {
			test();
		}
		
		private var a:Variable;
		private var b:Variable;
		private var c:Variable;
		private var d:Variable;
		
		private var numIterations:int = 1000;
		private var learningRate:Number = 0.5;
		private var optimizer:Optimizer;
		
		private function test():void {
			
			
			inits();
		
		}
		
		private function traceRst():void
		{
			trace("a:", a.dataSync()[0]);
			trace("b:", b.dataSync()[0]);
			trace("c:", c.dataSync()[0]);
			trace("d:",d.dataSync()[0]);
		}
		private function inits():void
		{
			a = variable(scalar(Math.random()));
			b = variable(scalar(Math.random()));
			c = variable(scalar(Math.random()));
			d = variable(scalar(Math.random()));
			
			optimizer = sgd(learningRate);
			
			 var trueCoefficients:Object = {a: -.8, b: -.2, c: .9, d: .5};
			var trainingData:Object = generateData(100, trueCoefficients);
			debugger;
			train(trainingData.xs, trainingData.ys, numIterations);
			debugger;
			traceRst();
		}
		
		private function generateData(numPoints:int, coeff:Object, sigma:Number = 0.04):Object
		{
			return tidy(function():* {
			var a:Scalar, b:Scalar, c:Scalar, d:Scalar; 

			a = scalar(coeff.a);
			b = scalar(coeff.b);
			c = scalar(coeff.c);
			d = scalar(coeff.d);

			var xs:Tensor = randomUniform([numPoints], -1, 1);

			// Generate polynomial data
			var three:Scalar = scalar(3, 'int32');
			var ys = a.mul(xs.pow(three))
			  .add(b.mul(xs.square()))
			  .add(c.mul(xs))
			  .add(d)
			  // Add random noise to the generated data
			  // to make the problem a bit more interesting
			  .add(randomNormal([numPoints], 0, sigma));

			// Normalize the y values to the range 0 to 1.
			var ymin = ys.min();
			var ymax = ys.max();
			var yrange = ymax.sub(ymin);
			var ysNormalized = ys.sub(ymin).div(yrange);

			return {
			  xs:xs, 
			  ys: ysNormalized
			};
			})
		}
		
		private function predict(x:*):* {
			return tidy(function():* {
					return a.mul(x.pow(scalar(3, 'int32'))).add(b.mul(x.square())).add(c.mul(x)).add(d);
				});
		}
		
		private function loss(prediction:*, labels:*):*
		{
			return prediction.sub(labels).square().mean();
		}
		
		private function train(xs:*, ys:*, numIterations:int):void
		{
			var i:int, len:int;
			len = numIterations;
			for (i = 0; i < len; i++)
			{
				optimizer.minimize(
				function():*
				{
					var pd:*= predict(xs);
					return loss(pd, ys);
				}
				);
			}
		}
	}

}