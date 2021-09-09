'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/COMMIT_EDITMSG": "6ef7ec310f374e2dd1dd83c8e9796216",
".git/config": "f578595ded287353602c636eafcee247",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ecbb0cb5ffb7d773cd5b2407b210cc3b",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "01b1688f97f94776baae85d77b06048b",
".git/hooks/pre-push.sample": "3c5989301dd4b949dfa1f43738a22819",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/update.sample": "517f14b9239689dff8bda3022ebd9004",
".git/index": "a644802beece4a690c4cb5c221b0282f",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "cbdc0a34a0894587272982b6265cd181",
".git/logs/refs/heads/master": "cbdc0a34a0894587272982b6265cd181",
".git/logs/refs/remotes/web/master": "292854995225db5b5a977a4f4dd72c1c",
".git/objects/93/5daa30c719f232e7f486d0f12fcea098f25b56": "623b91245aa662d45505d1ea63413a19",
".git/objects/00/2fc41d69240d29af2f40b834acb571fdf7d033": "6466a51be79b2139647fa0dd13dae983",
".git/objects/02/9781a515f58cb8b6b09e89b8c67929247f9aec": "12546885e6bbab1a3922a4a897c07bed",
".git/objects/05/05eef1230367363d3e7f7af2c38b23c8f761e0": "a8300beb13210cba13240120a19d13ac",
".git/objects/08/09aa6fba36c529c8e926dbca4f02759fc4fde0": "2b3c74902a5f5c37059696beef798769",
".git/objects/08/6d75e70d89208019ff39fb7c849541b4188ec3": "3a859d7e8253f59c84eda8d975ee5bff",
".git/objects/09/131cdd5447daf1f588efcd3908aa8592b1d25b": "dbf507514598ad5d683088a65367d0a7",
".git/objects/0e/3f859d021aa14ecf10cd3abb818d30aac399a1": "4e9a633709f84875355ad4b1f3a8af6c",
".git/objects/0f/816fb5068fb5d0dc1623718a94d7a34c5edfe4": "48392ce692d6328aef69a753fa305233",
".git/objects/10/f1e48c7fea546c4eb95d1bbb19b72284ad11a2": "aad9cd31cabd595d65da1cda3214dff1",
".git/objects/14/32e217b8f25f911d9f50516533e26bf4ce309e": "f0803373173d57b6401e4bc2f1f7bd60",
".git/objects/15/9b15011009e1e691b0761e5627dc3f3aa452ad": "822c0ced8e90203ed87ff7e0082d7945",
".git/objects/20/5bb5db271c6d8de8399864c7bb9b917f638893": "c993b22f115d7f3ae6d5b7b212806539",
".git/objects/23/637bc3573701e2ad80a6f8be31b82926b4715f": "5f84f5c437bb2791fdc8411523eae8ff",
".git/objects/30/a115ac7a15072482ce271431a448fb07bf8d72": "2c51b1df8d2c2977059c26633d9fe93f",
".git/objects/33/f6434f135957c4d597a003ee08798fe811320c": "bb9e52efcac1c6c247355999c14e1dee",
".git/objects/40/e21fa4603d1ddcdc4f701e77c1ea2130558958": "fc4026ade237cdca816c8b6d7be31bde",
".git/objects/41/d47912eda693de8d3d5a362287da51101a8478": "868a9a3ab664b6925d03b9fc693c8949",
".git/objects/43/f3f2532f5d1a9287f9a1ea5c53aa6c392faf7d": "6d9fb2383ea24f9c5e3301910479e05d",
".git/objects/44/122dcd8ffac94a2dfeedecea9b5d8eba83421c": "cc748b0daffffcb6ee5482c4fdede28e",
".git/objects/47/97a04b1191168f12c9446b38f25cbbd637684a": "8a0df74e057cf089e0bc24d91a3283bd",
".git/objects/49/75539bf3cbb79cadff093e9b52ff842998fcce": "2b67ec62088fdbd9ca8cb49bc5ae7e03",
".git/objects/4a/80c4f5336e3a1f2983695c37f48ffe0cb815ab": "4ab6859daac9cbbebfd6ee7140217184",
".git/objects/53/16136633e1e7d10a4153a1868548d7a06844b1": "69c1f8c7f84d161bd35d833741a5ed30",
".git/objects/53/3e76d76e0e42eac2688797908dabf2d1e7f12e": "1d22a5bed301167a16a5b08fc94c4cf3",
".git/objects/55/2362677691edbfe20579a8e5078854e29385d2": "d422208f2d5082fa04d25782b424986b",
".git/objects/56/3a234b5f368eec5d6bbd877ab5f7320d01fadc": "0ede44d40811630c12d987d305dc4f5f",
".git/objects/5d/e2d65160e9f3c63ff33d675c54607617cabcc6": "bc097f7b1c54c119859c48b64cbf20a2",
".git/objects/5f/f6e24f6335ed03090d5101da74c04fd4d4b4f4": "7445fcc8627f083a4338a45c6a6c59db",
".git/objects/61/ea3027c7dff0b3c0f513804388b0c78bab2cf4": "5be64266b2b260c556e24bff1b30f2e7",
".git/objects/62/459401f6dbc9f511472011fcb852fad70a0910": "aefef1aeb2b6e3510d3fad466767e6ad",
".git/objects/78/8cd44eb19017e1406bc1a0e08f3db483b0e9a7": "86990d382a5aa4626db292adbb88ebac",
".git/objects/7a/c7af1d9471773d096ab652712fa198d256b6ec": "75363efe592ecf405ab83a2fc74e7c52",
".git/objects/7b/b8b77f47b28ce39b53557b3bf3efc20d5186af": "f6be3353eb44b4d0a44850643ff3eb90",
".git/objects/81/0337fcab9374ea7916511a5b9b59c1fe38c5fd": "cc99e87ef5a5ad26f76eb93e555d98fa",
".git/objects/81/c7dd21697e50131a94fc637727d99eac5713dd": "6eebb6e883352e1cc8d332b7765b8430",
".git/objects/84/5f54f5a733faafa8d60b3e80d006e2d460ce20": "1b5f2947e5e54f1106df9c48bf10c6f4",
".git/objects/84/cb5a32b85efc67d9177672df8cd913d3ce69a3": "963902c4988f3145e63d82650ed603fe",
".git/objects/88/a3ef53e6145c7c21b45085a5fc02fc7310d761": "db0253a5405aecef8a4198acc672e7ff",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/7ff22e31c172b8f924738aaefdf837246fa198": "aa766a0cad877b2bb474f2970108a0ba",
".git/objects/94/a2f3c175cdd5b5bc70e0255f6a4edb33334a6f": "e31bace448e5eeb3c53fbbf4375a6a33",
".git/objects/95/0b4e66fef2b27fc59f93ba80c3507f1c6554b0": "4feb1dddb591ceeaf1f2b0f57b0e97dd",
".git/objects/9c/48b8e646783f52b8d83d54d135911e7c3d17de": "90affa72fd2f531f07e45d09e4548bc8",
".git/objects/a3/4749040c6e474419da37d7c7d7933eaad777d6": "81a898ca71c65fbc89c0d5e866dc401f",
".git/objects/a8/3a17d54b6dc2156c855c6580301cefc9c8d017": "6525101be8d70b808a809af9c83fa4ad",
".git/objects/ad/0c934b7af4df1485b7df021d565a5d9f9d8a0d": "549032dc0ab0961acf05a44b1902a46d",
".git/objects/b4/1736b42d1275ffe2f3dd2c8b959be50863a022": "837347a3333e5980927e67998c59cebf",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/bf/cb2193d8c8d7981dd54ecae48090e5d0e00ba5": "598d88848c5ae70142d36481ecc4049c",
".git/objects/c1/687ade60cd5d54bd212131ee355fb8670248b2": "7c01f6b00fb66a9e66cf490b6698308a",
".git/objects/c4/19bd1c2549be23c9fc37412b7d762e32dc2d35": "0d81a92fa4a5341bb9825ad73891c840",
".git/objects/c5/ddeda3c3426102291514a08c8de000f3c9e5f3": "4b49da75ed210f365a36e3946d728664",
".git/objects/c6/1d01a24351c0542ba7b914be1b31d4740f10ff": "92a88bf4113f0d9caa2d2f4782b3a53b",
".git/objects/c8/86103960e2826eb5bd50b4ecba89b8503bc06e": "223c39e2807edcb1bfcae918ec115f58",
".git/objects/cb/20766b3a049cc21df1634043b0350c8549fc92": "fed99b9359f271fc1086aa168dc59bf4",
".git/objects/cf/b0468d45e6fb009459fdb8c00dfc5a586fcd3d": "6b168819b44851895c9bcb4ad2c292eb",
".git/objects/d0/e03ed738bb02767bc7975e3428122c0064f603": "7d0bac1b268cf570f57f15ed81b33db0",
".git/objects/d0/ea56dc6dc6a0ff099229065c40aba8b54e2f4f": "438f04426f0674b42509cc63fe627f7c",
".git/objects/d7/685d8bb43819347d4c7372a4b4487ccceace75": "adad76d9d6cd1fd4700d3ad06ba5f7da",
".git/objects/db/a2c0b313a1bd4c2646c08fdb9f653b49361082": "0fd783f228b92c029f0e7307648c3cb9",
".git/objects/dc/53ea2bc6823d6b49b5553720c87def3a25460b": "7239225516a519f53296345e7e5a26c3",
".git/objects/e0/ffdf52d3da2ee4ab8845e42f074bce64a49add": "7dd024e1f589d8e47e0bd9cbf8edfda1",
".git/objects/e2/002afba352a43651c9d21b6f27f72224c39d3a": "95cd7882337fae5fa1f6c4bfb0701730",
".git/objects/eb/d32613e1191b3d552fb487c9a62a9f077eab5e": "11421409b0cf7311ad3ede588ea29edf",
".git/objects/f2/2f588f5926673095edacf3c5b0085bc5f11cc6": "eea468584a6e859827a5cc9cd85a6935",
".git/objects/f2/5787c93ad00665f0f797a43ab397f0628a273e": "59e425d1456034072d902c75d18ec75f",
".git/objects/f3/be82451e413c13e434faec0cce72696b290f7e": "c4e5f4f5d1b877daaaf253ca6624c77d",
".git/objects/f7/5a773bffa3a1362efeaa56e8643f127c3f47b9": "d846085c4628a3b56a1453617f477a1d",
".git/objects/f9/54d39736c8b3085fd38260b4f0d644f912dd16": "0481b3a5896c14916600ea34b6a9e0dc",
".git/objects/f9/b51265b300cbb2e10a96658fffcbc2f81c3b64": "6dec916ebb6c8cdf69526101cdc085ba",
".git/objects/fb/ae8dbfb0a996c646af7d6b5eb82ab7bb90c83f": "223e4b8a0434fa22d047e57a07d05131",
".git/objects/fb/e2810b2a5294fdcdad02faffcb054176c95bf7": "b15f47e769d4ca266d02eab6721c6227",
".git/refs/heads/master": "fa9fdd64ced9c3eb95cfc9e6b99f1f47",
".git/refs/remotes/web/master": "fa9fdd64ced9c3eb95cfc9e6b99f1f47",
"assets/AssetManifest.json": "039d3ea738b46cf7e04248b8d335d52f",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/images/pic1.jpeg": "ab4b99834df6b92c51bbc88d03825568",
"assets/images/psiseasy.png": "0a8e5dd4b4f1e67a104603f5d173ad3e",
"assets/NOTICES": "557406e87aa3b4f840dcf403e1771893",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "5a37ae808cf9f652198acde612b5328d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "2bca5ec802e40d3f4b60343e346cedde",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "2aa350bd2aeab88b601a593f793734c0",
"favicon.png": "cec06261144dd5f33864440510a04c82",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "3cf6a28f5cb48c5c1d311e95d3a02c6c",
"/": "3cf6a28f5cb48c5c1d311e95d3a02c6c",
"main.dart.js": "ed4ea99710268e746f19355ac1595c4c",
"manifest.json": "f9cfa56f6de3e4f1fe7315a00510dd2c",
"version.json": "899e23a26fc3de6f9e2fd02ba0c9d9f8"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
