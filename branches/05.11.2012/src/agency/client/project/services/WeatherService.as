package agency.client.project.services {
	import agency.client.project.model.AppModel;
	import agency.client.project.model.vo.WeatherVO;
	import agency.client.project.signals.WeatherSignal;

	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;

	import org.robotlegs.mvcs.Actor;

	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	/**
	 * @author franciscomurillo
	 */
	public class WeatherService extends Actor {
		[Inject]
		public var appModel : AppModel;
		
		[Inject]
		public var weatherSignal : WeatherSignal;
		
		private var _url : String;
		private var _weatherVO : WeatherVO;

		public function WeatherService() {
			trace(" appModel!!!!!!  " + appModel);
			//TODO:: arreglar esta mierda
		}

		public function getWeatherFor(location : String) : void {
			_url = "http://weather.yahooapis.com/forecastrss" + "?w=" + location + "&u=" + "c";
			trace("_url:: " + _url);
			loadXML(_url);
		}

		// This is going to contain all the data from the XML
		private var _xmlData : XML;

		private function loadXML(xmlURL : String) : void {
			var loader : URLLoader = new URLLoader();
			var request : URLRequest = new URLRequest(xmlURL);

			loader.load(request);
			loader.addEventListener(Event.COMPLETE, loadData);
		}

		private function loadData(event : Event) : void {
			_xmlData = new XML(event.currentTarget.data);

			var yweather : Namespace = new Namespace("http://xml.weather.yahoo.com/ns/rss/1.0");

			_weatherVO = new WeatherVO();
			_weatherVO.condition = _xmlData.channel.item.yweather::condition[0].@text;
			_weatherVO.temp = _xmlData.channel.item.yweather::condition[0].@temp;
			_weatherVO.location = _xmlData.channel.item.title;

			var temp : XMLList = new XMLList(String(_xmlData.channel.item.description[0]));
			_weatherVO.image = (new XML(temp[0])).@src;

			trace("++condition  " + _weatherVO.condition);
			trace("++temp  " + _weatherVO.temp);
			trace("++location  " + _weatherVO.location);
			trace("++image  " + _weatherVO.image);

			var loader : ImageLoader = new ImageLoader(_weatherVO.image, {container:this, onComplete:completeImageLoader});
			loader.load();
		}

		private function completeImageLoader(event : LoaderEvent) : void {
			// trace("IMAGE COMPLETE!!!!!!  " + event.target.rawContent);
			trace("IMAGE appModel!!!!!!  " + appModel);
			_weatherVO.bmp = event.target.rawContent;

			 appModel.weatherSet = _weatherVO;
		}
	}
}
