package gamelegs
{
	import flash.events.EventDispatcher;
	import flash.utils.setTimeout;

	public class Context extends EventDispatcher
	{
		public var logLevel:uint;
		
		
		public function Context()
		{
		}
		
		public function afterInitializing(callbackfun:Function):void{
		
			setTimeout(callbackfun,50);
		}
		
		public function install(module:*):Context{
		
			return this;
		}
		
		public var contextview:ContextView;
		
		
		public function configure(config:*):Context{
		
			if(config is Class){
				var init:Object=new config();
				
				if(init is GameLegsConfig){
//					(init as GameLegsConfig).
					map_Command=init["map_Command"]
						
				}
				
			}
			
			if(config is ContextView){
				contextview=config as ContextView;
				
			}
			
			return this;
		}
		
		public var map_Command:Function;
		
		
	}
}