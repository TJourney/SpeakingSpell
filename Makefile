BUILDTOOL = msbuild

# Set YOUR FFXIV WINEPREFIX PATH here:
WINEPREFIX = /data/tjourney/final-fantasy-xiv-online

APPDATA = $(WINEPREFIX)/drive_c/users/tjourney/Application Data

all: sampleplugin uidev

sampleplugin: SamplePlugin.sln SamplePlugin/SamplePlugin.csproj SamplePlugin/Plugin.cs SamplePlugin/Configuration.cs SamplePlugin/PluginUI.cs
	$(BUILDTOOL) -property:AppData=\"$(APPDATA)\" SamplePlugin

uidev: SamplePlugin.sln UIDev/UIDev.csproj UIDev/UITest.cs
	$(BUILDTOOL) -property:AppData=\"$(APPDATA)\" UIDev

install: sampleplugin
	mkdir -p output/SamplePlugin
	cp SamplePlugin/bin/Debug/samplePlugin.dll  output/SamplePlugin/
	cp SamplePlugin/bin/Debug/samplePlugin.json output/SamplePlugin/

clean:
	$(RM) -r */bin/ */obj/ output/
