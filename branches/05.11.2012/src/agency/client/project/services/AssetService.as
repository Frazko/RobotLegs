package agency.client.project.services {
	import agency.client.project.model.AppModel;
	import agency.client.project.model.vo.CitiesVO;
	import agency.client.project.model.vo.CityVO;
	import agency.client.project.model.vo.ProgressVO;
	import agency.client.project.signals.CompleteLoad;
	import agency.client.project.signals.ProgressSignal;

	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.CSSLoader;
	import com.greensock.loading.DataLoader;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.MP3Loader;
	import com.greensock.loading.SWFLoader;
	import com.greensock.loading.VideoLoader;
	import com.greensock.loading.XMLLoader;

	import org.robotlegs.mvcs.Actor;

	/**
	 * model.services.XMLService
	 *
	 * @author YourName
	 */
	public class AssetService extends Actor {
		[Inject]
		public var appModel : AppModel;
		[Inject]
		public var progressSignal : ProgressSignal;
		
		[Inject]
		public var loadingComplete :CompleteLoad;
		
		private var _loader : XMLLoader;

		public function AssetService() : void {
			// Remeber to import each type of *Loader* you will be using
			LoaderMax.activate([ImageLoader, SWFLoader, DataLoader, MP3Loader, XMLLoader, VideoLoader, CSSLoader]);
		}

		public function load(path : String) : void {
			trace("AssetService.load(path)  ");
			_loader = new XMLLoader(path, {name:"main", onProgress:progressHandler, onComplete:completeHandler, onError:errorHandler});
			_loader.load();
		}

		private function completeHandler(e : LoaderEvent) : void {
			trace("AssetService.completeHandler(e)  ");
			
			 parceData();
		}

		private function parceData() : void {
			trace("parceData");
			var xml:XML = _loader.content as XML;
            
            var vo:CitiesVO = new CitiesVO();
            vo.citiesArray = [];
            
            var citiesXML:XMLList = xml.assets.city;
			
			for each (var node : XML in citiesXML) {
				trace("ForEACHHHH NODE "+node)
				var cityVO:CityVO = new CityVO();
				cityVO.name = node.@name;
				cityVO.id = node.@id;
				vo.citiesArray.push(cityVO);
			}
			appModel.citiesVo = vo;
			trace("loading " + loadingComplete);
			loadingComplete.dispatch();
		}

		private function progressHandler(e : LoaderEvent) : void {
			trace("AssetService.ProgressHandler(e)  :"+e.target.progress);
			progressSignal.dispatch(new ProgressVO(e.target.progress));
		}

		private function errorHandler(e : LoaderEvent) : void {
			trace("AssetService.qErrorHandler(e)  ");
		}
	}
}