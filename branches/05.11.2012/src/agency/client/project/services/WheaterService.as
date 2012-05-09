package agency.client.project.services {
	import agency.client.project.model.vo.CityVO;
	import org.robotlegs.mvcs.Actor;

	import agency.client.project.model.AppModel;

	import com.greensock.events.LoaderEvent;

	import flash.display.Bitmap;

	import com.greensock.loading.ImageLoader;

	import agency.client.project.model.vo.WheaterVO;

	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	/**
	 * @author alejandromurillo
	 */
	public class WheaterService extends Actor {
		//ALI inject the appModel
		[Inject]
		public var appModel:AppModel;
		
		private var _wheaterVo : WheaterVO;
		private var _vo:CityVO;

///ALI -   No need for a constructor or to pass appModel		

		public function WheaterService() {
			trace("WheaterService");
			
		}

		public function SearchCityWheater(vo : CityVO) : void {
			trace("WheaterService:SearchCityWheater ");
            _vo = vo;
			var url : String = "http://weather.yahooapis.com/forecastrss" + "?w=" + vo.id + "&u=c";

			var loader : URLLoader = new URLLoader();
			var request : URLRequest = new URLRequest(url);
			loader.addEventListener(Event.COMPLETE, onDataLoaded);
			loader.load(request);
		}

		private function onDataLoaded(event : Event) : void {
			// trace("onDataLoaded event.currentTarget " + event.currentTarget.data);
			var _xmlData : XML = new XML(event.currentTarget.data);

			var yweather : Namespace = new Namespace("http://xml.weather.yahoo.com/ns/rss/1.0");

			var title : String = _xmlData.channel.item.title;
			var condition : String = _xmlData.channel.item.yweather::condition[0].@text;
			var temperture : String = _xmlData.channel.item.yweather::condition[0].@temp;
			var imageUrl : String = _xmlData.channel.item.description;
			var startIndex : Number = imageUrl.search("http:");
			var endIndex : Number = imageUrl.search("gif") + 3;
			imageUrl = imageUrl.substring(startIndex, endIndex);
			
			
			_vo.conditions = new WheaterVO;
			_vo.conditions.title = title;
            _vo.conditions.condition = condition;
			_vo.conditions.temperature = temperture;
			//_wheaterVo = new WheaterVO();
			//_wheaterVo.title = title;
			//_wheaterVo.condition = condition;
			//_wheaterVo.temperature = temperture;

			trace("startIndex " + startIndex + " title " + title);
			trace("imageUrl " + imageUrl);

			var loader : ImageLoader = new ImageLoader(imageUrl, {scaleMode:"proportionalInside", bgColor:0xFF0000, container:this, x:50, y:70, onComplete:onImageLoaded});
			loader.load();
		}

		private function onImageLoaded(e : LoaderEvent) : void {
			trace("IMAGE COMPLETE!!!!!!  " + e.target.rawContent);
			//_wheaterVo.image = e.target.rawContent as Bitmap;
			_vo.conditions.image =  e.target.rawContent as Bitmap;
			appModel.cityVo = _vo;
		}
	}
}
