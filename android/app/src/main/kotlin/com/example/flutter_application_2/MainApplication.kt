import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
  override fun onCreate() {
    super.onCreate()
    MapKitFactory.setApiKey("62088637-6c93-4fea-b0ed-b29d4424d61d") // Your generated API key
  }
}