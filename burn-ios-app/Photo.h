//
//  Photo.h
//  burn-ios-app
//
//  Created by Anita Santoso on 13/10/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Photo : NSObject
- (id)initWithDictionary:(NSDictionary*)dict;
@property (nonatomic, strong) NSString *thumbnailURL;
@property (nonatomic, strong) NSString *photoURL;
@property (nonatomic, strong) NSString *photoID;
@property CLLocationCoordinate2D location;
@property int distancdeInM;
@end

/**
 (lldb) po JSON
 {
 albums =     {
 items =         (
 {
 favorited = 0;
 id = 5071;
 location =                 {
 cityAlbum =                     {
 id = 17;
 name = Berlin;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = city;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/17";
 };
 countryAlbum =                     {
 id = 23;
 name = Germany;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = country;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/23";
 };
 latitude = "52.501117652803";
 longitude = "13.450426576125";
 venueService =                     {
 category = 4bf58dd8d48988d1fa931735;
 categoryName = Hotel;
 id = 4c2884dc9eb19521f9862959;
 name = foursquare;
 };
 };
 muted = 0;
 name = "nhow Berlin";
 photos =                 {
 items =                     (
 {
 height = 2048;
 id = 19604041;
 photoUrl = "http://www.eyeem.com/thumb/640/480/44701f9f0ee0bcf56a32c833a0df92fb92553ee7-1378662888";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/44701f9f0ee0bcf56a32c833a0df92fb92553ee7-1378662888";
 updated = "2013-09-08T19:54:49+0200";
 webUrl = "http://www.eyeem.com/p/19604041";
 width = 1536;
 },
 {
 height = 2048;
 id = 19584057;
 photoUrl = "http://www.eyeem.com/thumb/640/480/6a372ad7395ac0a6eb79be29b911d644a0f6d672-1378647616";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/6a372ad7395ac0a6eb79be29b911d644a0f6d672-1378647616";
 updated = "2013-09-08T15:40:33+0200";
 webUrl = "http://www.eyeem.com/p/19584057";
 width = 1536;
 },
 {
 height = 1116;
 id = 18825806;
 photoUrl = "http://www.eyeem.com/thumb/640/480/d588544b4e536bd58c62e1ed1e78d75fa9b7ded8-1377724893";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/d588544b4e536bd58c62e1ed1e78d75fa9b7ded8-1377724893";
 updated = "2013-08-28T23:24:54+0200";
 webUrl = "http://www.eyeem.com/p/18825806";
 width = 836;
 },
 {
 height = 2048;
 id = 18819654;
 photoUrl = "http://www.eyeem.com/thumb/640/480/ca27b4c748cff53e50770a56e1f2f7185719c15f-1377718962";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/ca27b4c748cff53e50770a56e1f2f7185719c15f-1377718962";
 updated = "2013-08-28T21:42:45+0200";
 webUrl = "http://www.eyeem.com/p/18819654";
 width = 1536;
 },
 {
 height = 1536;
 id = 18682872;
 photoUrl = "http://www.eyeem.com/thumb/640/480/bae8e7a9a31ad9d015e4cecd8cea9aaf62d53b71-1377546523";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/bae8e7a9a31ad9d015e4cecd8cea9aaf62d53b71-1377546523";
 updated = "2013-08-26T21:48:44+0200";
 webUrl = "http://www.eyeem.com/p/18682872";
 width = 2048;
 },
 {
 height = 1024;
 id = 16319722;
 photoUrl = "http://www.eyeem.com/thumb/640/480/49631acc5374f42e470dd36893730d7c23177a69-1374148158";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/49631acc5374f42e470dd36893730d7c23177a69-1374148158";
 updated = "2013-07-18T13:49:30+0200";
 webUrl = "http://www.eyeem.com/p/16319722";
 width = 768;
 },
 {
 height = 1296;
 id = 15506534;
 photoUrl = "http://www.eyeem.com/thumb/640/480/0b0a41782e2559b04054c95b0159dcbe40aba59e-1372743352";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/0b0a41782e2559b04054c95b0159dcbe40aba59e-1372743352";
 updated = "2013-07-02T07:35:53+0200";
 webUrl = "http://www.eyeem.com/p/15506534";
 width = 972;
 },
 {
 height = 1296;
 id = 15044162;
 photoUrl = "http://www.eyeem.com/thumb/640/480/05231965616dc96b784b602ae5aca85e2deed22c-1371987103";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/05231965616dc96b784b602ae5aca85e2deed22c-1371987103";
 updated = "2013-06-23T13:32:22+0200";
 webUrl = "http://www.eyeem.com/p/15044162";
 width = 972;
 },
 {
 height = 1296;
 id = 14305340;
 photoUrl = "http://www.eyeem.com/thumb/640/480/563f61b07bd6b5cd65e02ee111279d1515822ecb-1370775287";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/563f61b07bd6b5cd65e02ee111279d1515822ecb-1370775287";
 updated = "2013-06-09T12:54:47+0200";
 webUrl = "http://www.eyeem.com/p/14305340";
 width = 972;
 },
 {
 height = 512;
 id = 13295496;
 photoUrl = "http://www.eyeem.com/thumb/640/480/d76e9783fad73488a68020f55deae2adc73bb8e5-1369171885";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/d76e9783fad73488a68020f55deae2adc73bb8e5-1369171885";
 updated = "2013-05-21T23:32:12+0200";
 webUrl = "http://www.eyeem.com/p/13295496";
 width = 912;
 }
 );
 limit = 10;
 offset = 0;
 total = 102;
 };
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/c76ea818fc262512d5256e0c970123e21728a2c2-1339345525";
 totalContributors = 57;
 totalLikers = 12;
 totalPhotos = 102;
 type = venue;
 updated = "2013-09-08T19:54:49+0200";
 webUrl = "http://www.eyeem.com/a/5071";
 },
 {
 favorited = 0;
 id = 114930;
 location =                 {
 cityAlbum =                     {
 id = 17;
 name = Berlin;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = city;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/17";
 };
 countryAlbum =                     {
 id = 23;
 name = Germany;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = country;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/23";
 };
 latitude = "52.502244906384";
 longitude = "13.447550677415";
 venueService =                     {
 category = 4bf58dd8d48988d124941735;
 categoryName = Office;
 id = 4b5da462f964a520c86429e3;
 name = foursquare;
 };
 };
 muted = 0;
 name = "Universal Music";
 photos =                 {
 items =                     (
 {
 height = 960;
 id = 19585820;
 photoUrl = "http://www.eyeem.com/thumb/640/480/fea3f46b4c2b04863ab412625a19f0c7239e4198-1378649089";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/fea3f46b4c2b04863ab412625a19f0c7239e4198-1378649089";
 updated = "2013-09-08T16:05:11+0200";
 webUrl = "http://www.eyeem.com/p/19585820";
 width = 1280;
 },
 {
 height = 2048;
 id = 19581389;
 photoUrl = "http://www.eyeem.com/thumb/640/480/ce3889beac9114a7837615c27b4cbc06f16652fb-1378645302";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/ce3889beac9114a7837615c27b4cbc06f16652fb-1378645302";
 updated = "2013-09-08T15:02:48+0200";
 webUrl = "http://www.eyeem.com/p/19581389";
 width = 1536;
 },
 {
 height = 2048;
 id = 19162709;
 photoUrl = "http://www.eyeem.com/thumb/640/480/3320ab107dd5ab002c74432c2e6093628641971e-1378125898";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/3320ab107dd5ab002c74432c2e6093628641971e-1378125898";
 updated = "2013-09-02T14:45:31+0200";
 webUrl = "http://www.eyeem.com/p/19162709";
 width = 1536;
 },
 {
 height = 1536;
 id = 18685696;
 photoUrl = "http://www.eyeem.com/thumb/640/480/6cbcc9fbeba158c73ab1e005e94aca7245718de0-1377549242";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/6cbcc9fbeba158c73ab1e005e94aca7245718de0-1377549242";
 updated = "2013-08-26T22:34:09+0200";
 webUrl = "http://www.eyeem.com/p/18685696";
 width = 2048;
 },
 {
 height = 972;
 id = 16013750;
 photoUrl = "http://www.eyeem.com/thumb/640/480/0bf681a54813d071e54eff5e1a1c1e6e000c3403-1373628202";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/0bf681a54813d071e54eff5e1a1c1e6e000c3403-1373628202";
 updated = "2013-07-12T13:23:32+0200";
 webUrl = "http://www.eyeem.com/p/16013750";
 width = 1296;
 },
 {
 height = 769;
 id = 13221483;
 photoUrl = "http://www.eyeem.com/thumb/640/480/360e83feaa484751946b323a03838643fd0665d5-1369051412";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/360e83feaa484751946b323a03838643fd0665d5-1369051412";
 updated = "2013-05-20T14:04:15+0200";
 webUrl = "http://www.eyeem.com/p/13221483";
 width = 1024;
 },
 {
 height = 612;
 id = 6338472;
 photoUrl = "http://www.eyeem.com/thumb/640/480/8610aa52912e6496b817eb65b33e70a003b27d78-1359628793";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/8610aa52912e6496b817eb65b33e70a003b27d78-1359628793";
 updated = "2013-01-31T10:33:58+0100";
 webUrl = "http://www.eyeem.com/p/6338472";
 width = 612;
 },
 {
 height = 612;
 id = 6338355;
 photoUrl = "http://www.eyeem.com/thumb/640/480/93ffc1032d5aff1840b0b41d6346122dc7c2db08-1359628596";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/93ffc1032d5aff1840b0b41d6346122dc7c2db08-1359628596";
 updated = "2012-11-23T09:08:37+0100";
 webUrl = "http://www.eyeem.com/p/6338355";
 width = 612;
 },
 {
 height = 612;
 id = 4277656;
 photoUrl = "http://www.eyeem.com/thumb/640/480/4952294c3ca6f9ace7cf36a4474a6f962c37d941-1358588180";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/4952294c3ca6f9ace7cf36a4474a6f962c37d941-1358588180";
 updated = "2012-10-25T09:57:41+0200";
 webUrl = "http://www.eyeem.com/p/4277656";
 width = 612;
 },
 {
 height = 972;
 id = 1101011;
 photoUrl = "http://www.eyeem.com/thumb/640/480/2b7be4e1222412920af7c314b35ab8d70aec1c86-1350140836";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/2b7be4e1222412920af7c314b35ab8d70aec1c86-1350140836";
 updated = "2012-10-13T17:07:45+0200";
 webUrl = "http://www.eyeem.com/p/1101011";
 width = 1296;
 }
 );
 limit = 10;
 offset = 0;
 total = 20;
 };
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/33f86d8a5df27dfd54731276876dfbe1499191a9-1336653117";
 totalContributors = 14;
 totalLikers = 0;
 totalPhotos = 20;
 type = venue;
 updated = "2013-09-08T16:05:11+0200";
 webUrl = "http://www.eyeem.com/a/114930";
 },
 {
 favorited = 0;
 id = 755645;
 location =                 {
 cityAlbum =                     {
 id = 17;
 name = Berlin;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = city;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/17";
 };
 countryAlbum =                     {
 id = 23;
 name = Germany;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = country;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/23";
 };
 latitude = "52.49914932";
 longitude = "13.44872093";
 venueService =                     {
 category = 4bf58dd8d48988d174941735;
 categoryName = "Coworking Space";
 id = 5076fb81e4b02f07ed3bd538;
 name = foursquare;
 };
 };
 muted = 0;
 name = Unternehmerhelden;
 photos =                 {
 items =                     (
 {
 height = 968;
 id = 9868982;
 photoUrl = "http://www.eyeem.com/thumb/640/480/8fdf5d6a89eb1e89ed5917042a82220a579dfd28-1363820190";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/8fdf5d6a89eb1e89ed5917042a82220a579dfd28-1363820190";
 updated = "2013-03-20T23:57:12+0100";
 webUrl = "http://www.eyeem.com/p/9868982";
 width = 1296;
 },
 {
 height = 1296;
 id = 9868881;
 photoUrl = "http://www.eyeem.com/thumb/640/480/1b5ee442ac2d71d5971d314cb13cddab70e6e3f1-1363820015";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/1b5ee442ac2d71d5971d314cb13cddab70e6e3f1-1363820015";
 updated = "2013-03-20T23:54:43+0100";
 webUrl = "http://www.eyeem.com/p/9868881";
 width = 968;
 },
 {
 height = 960;
 id = 7924452;
 photoUrl = "http://www.eyeem.com/thumb/640/480/f27680e7ba026abd8f17a8081be07d7794d81b2e-1361183162";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/f27680e7ba026abd8f17a8081be07d7794d81b2e-1361183162";
 updated = "2013-02-18T11:27:22+0100";
 webUrl = "http://www.eyeem.com/p/7924452";
 width = 960;
 },
 {
 height = 567;
 id = 7528559;
 photoUrl = "http://www.eyeem.com/thumb/640/480/60515e5222b34dabecf6d28650dbaba1deeb91a5-1360757860";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/60515e5222b34dabecf6d28650dbaba1deeb91a5-1360757860";
 updated = "2013-02-13T13:17:55+0100";
 webUrl = "http://www.eyeem.com/p/7528559";
 width = 567;
 },
 {
 height = 805;
 id = 7457320;
 photoUrl = "http://www.eyeem.com/thumb/640/480/23cbe3afada7b22b9e82e3b75ecf6bd3a59db35a-1360677281";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/23cbe3afada7b22b9e82e3b75ecf6bd3a59db35a-1360677281";
 updated = "2013-02-12T14:54:47+0100";
 webUrl = "http://www.eyeem.com/p/7457320";
 width = 805;
 },
 {
 height = 827;
 id = 6755919;
 photoUrl = "http://www.eyeem.com/thumb/640/480/3763a509241716cbc360d2bc0062ad08b62c5bc1-1359978115";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/3763a509241716cbc360d2bc0062ad08b62c5bc1-1359978115";
 updated = "2013-02-04T12:42:38+0100";
 webUrl = "http://www.eyeem.com/p/6755919";
 width = 827;
 },
 {
 height = 633;
 id = 6754890;
 photoUrl = "http://www.eyeem.com/thumb/640/480/83a478351ed11c2209835a037a94eb8522b041a4-1359976136";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/83a478351ed11c2209835a037a94eb8522b041a4-1359976136";
 updated = "2013-02-04T12:08:31+0100";
 webUrl = "http://www.eyeem.com/p/6754890";
 width = 634;
 },
 {
 height = 960;
 id = 6445617;
 photoUrl = "http://www.eyeem.com/thumb/640/480/1a819ee1d4c428316674ae66f3e6d3fe4bcb41a2-1359730245";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/1a819ee1d4c428316674ae66f3e6d3fe4bcb41a2-1359730245";
 updated = "2013-02-01T15:51:33+0100";
 webUrl = "http://www.eyeem.com/p/6445617";
 width = 960;
 },
 {
 height = 968;
 id = 5283702;
 photoUrl = "http://www.eyeem.com/thumb/640/480/7d0f6efd94530b48de6998caa3eba6ee808d6d31-1358950018";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/7d0f6efd94530b48de6998caa3eba6ee808d6d31-1358950018";
 updated = "2013-01-23T15:07:10+0100";
 webUrl = "http://www.eyeem.com/p/5283702";
 width = 1296;
 },
 {
 height = 863;
 id = 5268307;
 photoUrl = "http://www.eyeem.com/thumb/640/480/90b784ad157cf6e546203c00077950ca1092a9d0-1358938094";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/90b784ad157cf6e546203c00077950ca1092a9d0-1358938094";
 updated = "2013-01-23T11:48:40+0100";
 webUrl = "http://www.eyeem.com/p/5268307";
 width = 863;
 }
 );
 limit = 10;
 offset = 0;
 total = 16;
 };
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/d40487bcc2efea8c847e96eb99290aa54bc98c92-1354885970";
 totalContributors = 5;
 totalLikers = 1;
 totalPhotos = 16;
 type = venue;
 updated = "2013-03-20T23:57:12+0100";
 webUrl = "http://www.eyeem.com/a/755645";
 },
 {
 favorited = 0;
 id = 114932;
 location =                 {
 cityAlbum =                     {
 id = 17;
 name = Berlin;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = city;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/17";
 };
 countryAlbum =                     {
 id = 23;
 name = Germany;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = country;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/23";
 };
 latitude = "52.501933326903";
 longitude = "13.448703289032";
 venueService =                     {
 category = 4bf58dd8d48988d124941735;
 categoryName = Office;
 id = 4c07db84221620a17073f775;
 name = foursquare;
 };
 };
 muted = 0;
 name = "Design Hotels HQ";
 photos =                 {
 items =                     (
 {
 height = 1296;
 id = 11840155;
 photoUrl = "http://www.eyeem.com/thumb/640/480/fc98a2757fd0eb77b48a4929cf9cdc166ab3c676-1366876738";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/fc98a2757fd0eb77b48a4929cf9cdc166ab3c676-1366876738";
 updated = "2013-04-25T09:59:27+0200";
 webUrl = "http://www.eyeem.com/p/11840155";
 width = 972;
 },
 {
 height = 1296;
 id = 1561971;
 photoUrl = "http://www.eyeem.com/thumb/640/480/da9a15d0a3d041fe3656a2544e8100c6dd2d86a5-1354791515";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/da9a15d0a3d041fe3656a2544e8100c6dd2d86a5-1354791515";
 updated = "2012-12-06T11:59:07+0100";
 webUrl = "http://www.eyeem.com/p/1561971";
 width = 968;
 },
 {
 height = 1296;
 id = 1491803;
 photoUrl = "http://www.eyeem.com/thumb/640/480/f4b3782292e86d78be628bf2f4501140c862ec70-1354176300";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/f4b3782292e86d78be628bf2f4501140c862ec70-1354176300";
 updated = "2012-11-29T09:05:10+0100";
 webUrl = "http://www.eyeem.com/p/1491803";
 width = 968;
 },
 {
 height = 1138;
 id = 1435629;
 photoUrl = "http://www.eyeem.com/thumb/640/480/94c6e3160c55abdf18f2942d35a3c4c9f6e58860-1353666908";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/94c6e3160c55abdf18f2942d35a3c4c9f6e58860-1353666908";
 updated = "2012-11-23T11:37:37+0100";
 webUrl = "http://www.eyeem.com/p/1435629";
 width = 1137;
 },
 {
 height = 646;
 id = 1408096;
 photoUrl = "http://www.eyeem.com/thumb/640/480/600046438a7180f870fe7b91f103919a6e7d6209-1353405196";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/600046438a7180f870fe7b91f103919a6e7d6209-1353405196";
 updated = "2012-11-20T10:54:19+0100";
 webUrl = "http://www.eyeem.com/p/1408096";
 width = 646;
 },
 {
 height = 972;
 id = 1402162;
 photoUrl = "http://www.eyeem.com/thumb/640/480/53b014fd8f3b6a8b4a6a43ccee17f7ceba8176d2-1353344335";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/53b014fd8f3b6a8b4a6a43ccee17f7ceba8176d2-1353344335";
 updated = "2012-11-19T17:58:56+0100";
 webUrl = "http://www.eyeem.com/p/1402162";
 width = 1296;
 },
 {
 height = 1296;
 id = 1400499;
 photoUrl = "http://www.eyeem.com/thumb/640/480/13a60ed13db572bcb1bffd385f1cbdc4810b56c0-1353332351";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/13a60ed13db572bcb1bffd385f1cbdc4810b56c0-1353332351";
 updated = "2012-11-19T14:41:46+0100";
 webUrl = "http://www.eyeem.com/p/1400499";
 width = 972;
 },
 {
 height = 612;
 id = 616254;
 photoUrl = "http://www.eyeem.com/thumb/640/480/1aa85aac334c08151068cd5e5d32a03af3af941c-1339848334";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/1aa85aac334c08151068cd5e5d32a03af3af941c-1339848334";
 updated = "2012-06-16T14:06:40+0200";
 webUrl = "http://www.eyeem.com/p/616254";
 width = 816;
 },
 {
 height = 612;
 id = 616183;
 photoUrl = "http://www.eyeem.com/thumb/640/480/20363fb2aee72baf10ff49372349a2e2e1959c98-1339847050";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/20363fb2aee72baf10ff49372349a2e2e1959c98-1339847050";
 updated = "2012-06-16T13:44:47+0200";
 webUrl = "http://www.eyeem.com/p/616183";
 width = 816;
 },
 {
 height = 816;
 id = 603096;
 photoUrl = "http://www.eyeem.com/thumb/640/480/c4d00870ba6e8afc54a0973bd692a6486fe47124-1339570983";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/c4d00870ba6e8afc54a0973bd692a6486fe47124-1339570983";
 updated = "2012-06-13T09:03:38+0200";
 webUrl = "http://www.eyeem.com/p/603096";
 width = 612;
 }
 );
 limit = 10;
 offset = 0;
 total = 15;
 };
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/fb863984c52ff111e51698e2795ede40a36c88d1-1328523989";
 totalContributors = 5;
 totalLikers = 1;
 totalPhotos = 15;
 type = venue;
 updated = "2013-09-24T09:29:38+0200";
 webUrl = "http://www.eyeem.com/a/114932";
 },
 {
 favorited = 0;
 id = 180224;
 location =                 {
 cityAlbum =                     {
 id = 17;
 name = Berlin;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = city;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/17";
 };
 countryAlbum =                     {
 id = 23;
 name = Germany;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = country;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/23";
 };
 latitude = "52.501670766487";
 longitude = "13.4490048964";
 venueService =                     {
 category = 4bf58dd8d48988d1e0941735;
 categoryName = "Harbor / Marina";
 id = 4eb670192c5b53141ac0636d;
 name = foursquare;
 };
 };
 muted = 0;
 name = "Spree Ufer";
 photos =                 {
 items =                     (
 {
 height = 1537;
 id = 19584348;
 photoUrl = "http://www.eyeem.com/thumb/640/480/32aac4ab18871b5b84ad2feb96f884b4aac2ad5b-1378647855";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/32aac4ab18871b5b84ad2feb96f884b4aac2ad5b-1378647855";
 updated = "2013-09-08T15:44:31+0200";
 webUrl = "http://www.eyeem.com/p/19584348";
 width = 1536;
 },
 {
 height = 1536;
 id = 19583545;
 photoUrl = "http://www.eyeem.com/thumb/640/480/cbe4450a9b9df785e746554dda6579d145c8b6c6-1378647185";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/cbe4450a9b9df785e746554dda6579d145c8b6c6-1378647185";
 updated = "2013-09-08T15:33:32+0200";
 webUrl = "http://www.eyeem.com/p/19583545";
 width = 2048;
 },
 {
 height = 2048;
 id = 17839393;
 photoUrl = "http://www.eyeem.com/thumb/640/480/acdfd5ffed2200685bb4c0784fb9501e5e9bbbf2-1376653380";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/acdfd5ffed2200685bb4c0784fb9501e5e9bbbf2-1376653380";
 updated = "2013-08-16T13:43:04+0200";
 webUrl = "http://www.eyeem.com/p/17839393";
 width = 1529;
 },
 {
 height = 596;
 id = 16592985;
 photoUrl = "http://www.eyeem.com/thumb/640/480/ac8d0dc67af65c85ca4492b455ff9bdcfae2568d-1374603859";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/ac8d0dc67af65c85ca4492b455ff9bdcfae2568d-1374603859";
 updated = "2013-07-23T20:25:11+0200";
 webUrl = "http://www.eyeem.com/p/16592985";
 width = 596;
 },
 {
 height = 972;
 id = 14789173;
 photoUrl = "http://www.eyeem.com/thumb/640/480/342e87457973f75385dfbb0aa9404fcaa8a5c868-1371552471";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/342e87457973f75385dfbb0aa9404fcaa8a5c868-1371552471";
 updated = "2013-06-18T12:49:07+0200";
 webUrl = "http://www.eyeem.com/p/14789173";
 width = 1296;
 },
 {
 height = 1296;
 id = 14375636;
 photoUrl = "http://www.eyeem.com/thumb/640/480/e6105f4680716fdddeb3d8fbed2846e3c43353ab-1370878908";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/e6105f4680716fdddeb3d8fbed2846e3c43353ab-1370878908";
 updated = "2013-06-10T17:42:13+0200";
 webUrl = "http://www.eyeem.com/p/14375636";
 width = 972;
 },
 {
 height = 972;
 id = 14305449;
 photoUrl = "http://www.eyeem.com/thumb/640/480/0ab37176263d72ddffc2c997277c5609e7e1c869-1370775436";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/0ab37176263d72ddffc2c997277c5609e7e1c869-1370775436";
 updated = "2013-06-09T12:57:17+0200";
 webUrl = "http://www.eyeem.com/p/14305449";
 width = 1296;
 },
 {
 height = 1296;
 id = 11810727;
 photoUrl = "http://www.eyeem.com/thumb/640/480/d8a5ca516327299144bd9e1e7f8cbdabb145d639-1366825898";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/d8a5ca516327299144bd9e1e7f8cbdabb145d639-1366825898";
 updated = "2013-04-24T19:52:39+0200";
 webUrl = "http://www.eyeem.com/p/11810727";
 width = 968;
 },
 {
 height = 1296;
 id = 11257656;
 photoUrl = "http://www.eyeem.com/thumb/640/480/cb75853a6a2805eccc223415cfa5c56ef09a95ea-1365938023";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/cb75853a6a2805eccc223415cfa5c56ef09a95ea-1365938023";
 updated = "2013-04-14T13:13:43+0200";
 webUrl = "http://www.eyeem.com/p/11257656";
 width = 972;
 },
 {
 height = 578;
 id = 10368816;
 photoUrl = "http://www.eyeem.com/thumb/640/480/a942cce15b19fb0200fd83911dd5bb4afa1b6a1c-1364565238";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/a942cce15b19fb0200fd83911dd5bb4afa1b6a1c-1364565238";
 updated = "2013-03-29T14:54:18+0100";
 webUrl = "http://www.eyeem.com/p/10368816";
 width = 579;
 }
 );
 limit = 10;
 offset = 0;
 total = 13;
 };
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/1ce4410cb07e5c61b01a1816f9c73e9b3e37e109-1334501290";
 totalContributors = 11;
 totalLikers = 0;
 totalPhotos = 13;
 type = venue;
 updated = "2013-09-08T15:44:31+0200";
 webUrl = "http://www.eyeem.com/a/180224";
 },
 {
 favorited = 0;
 id = 541;
 location =                 {
 cityAlbum =                     {
 id = 17;
 name = Berlin;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = city;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/17";
 };
 countryAlbum =                     {
 id = 23;
 name = Germany;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = country;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/23";
 };
 latitude = "52.501753621692";
 longitude = "13.448598268331";
 venueService =                     {
 category = 4bf58dd8d48988d124941735;
 categoryName = Office;
 id = 4af7d34ff964a520640a22e3;
 name = foursquare;
 };
 };
 muted = 0;
 name = "Neue Digitale / Razorfish";
 photos =                 {
 items =                     (
 {
 height = 1006;
 id = 16932339;
 photoUrl = "http://www.eyeem.com/thumb/640/480/6080eba5f4f09c0fcbe337ff6b3442b6a9f2e153-1375187743";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/6080eba5f4f09c0fcbe337ff6b3442b6a9f2e153-1375187743";
 updated = "2013-07-30T14:36:13+0200";
 webUrl = "http://www.eyeem.com/p/16932339";
 width = 1007;
 },
 {
 height = 960;
 id = 15099584;
 photoUrl = "http://www.eyeem.com/thumb/640/480/78682408378471eb43a39ff6e83a840a306c27df-1372071653";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/78682408378471eb43a39ff6e83a840a306c27df-1372071653";
 updated = "2013-06-24T13:00:57+0200";
 webUrl = "http://www.eyeem.com/p/15099584";
 width = 1280;
 },
 {
 height = 593;
 id = 14360687;
 photoUrl = "http://www.eyeem.com/thumb/640/480/e5de50791c173ada7ef31a4a77e373bcb9240323-1370852571";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/e5de50791c173ada7ef31a4a77e373bcb9240323-1370852571";
 updated = "2013-06-10T10:22:53+0200";
 webUrl = "http://www.eyeem.com/p/14360687";
 width = 443;
 },
 {
 height = 972;
 id = 14140521;
 photoUrl = "http://www.eyeem.com/thumb/640/480/761d1ca979752ad288a6f761b732c9c0a2095fbc-1370521784";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/761d1ca979752ad288a6f761b732c9c0a2095fbc-1370521784";
 updated = "2013-06-06T14:29:38+0200";
 webUrl = "http://www.eyeem.com/p/14140521";
 width = 1296;
 },
 {
 height = 972;
 id = 14051743;
 photoUrl = "http://www.eyeem.com/thumb/640/480/17f06614dcbb5ab71f2b21fc44febb352a5672b1-1370365160";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/17f06614dcbb5ab71f2b21fc44febb352a5672b1-1370365160";
 updated = "2013-06-04T18:59:21+0200";
 webUrl = "http://www.eyeem.com/p/14051743";
 width = 1296;
 },
 {
 height = 960;
 id = 14044902;
 photoUrl = "http://www.eyeem.com/thumb/640/480/d506cb0271ab29959d20916c9cf138ec52be057a-1370355299";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/d506cb0271ab29959d20916c9cf138ec52be057a-1370355299";
 updated = "2013-06-04T16:15:00+0200";
 webUrl = "http://www.eyeem.com/p/14044902";
 width = 1280;
 },
 {
 height = 1296;
 id = 13707909;
 photoUrl = "http://www.eyeem.com/thumb/640/480/8c09d593bf9fcae2b53d19b661b928200dae073b-1369829905";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/8c09d593bf9fcae2b53d19b661b928200dae073b-1369829905";
 updated = "2013-05-29T14:18:28+0200";
 webUrl = "http://www.eyeem.com/p/13707909";
 width = 1296;
 },
 {
 height = 1280;
 id = 13329740;
 photoUrl = "http://www.eyeem.com/thumb/640/480/bb0117d27662c666ba2cdd4cc3d8098826da2c48-1369237427";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/bb0117d27662c666ba2cdd4cc3d8098826da2c48-1369237427";
 updated = "2013-05-22T17:43:47+0200";
 webUrl = "http://www.eyeem.com/p/13329740";
 width = 960;
 },
 {
 height = 1296;
 id = 12890086;
 photoUrl = "http://www.eyeem.com/thumb/640/480/ead1eb2b5fae26996e7e10e8a0a1f08aed55dcfc-1368519287";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/ead1eb2b5fae26996e7e10e8a0a1f08aed55dcfc-1368519287";
 updated = "2013-05-14T10:14:48+0200";
 webUrl = "http://www.eyeem.com/p/12890086";
 width = 1296;
 },
 {
 height = 972;
 id = 12069678;
 photoUrl = "http://www.eyeem.com/thumb/640/480/1fb6430fd93dd26cdf1aeb78e727c0deeeb39112-1367220132";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/1fb6430fd93dd26cdf1aeb78e727c0deeeb39112-1367220132";
 updated = "2013-04-29T09:22:13+0200";
 webUrl = "http://www.eyeem.com/p/12069678";
 width = 1296;
 }
 );
 limit = 10;
 offset = 0;
 total = 12;
 };
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/aff406eb28fc7fa6a00afefba3d327b1a7908dbd-1316171164";
 totalContributors = 4;
 totalLikers = 0;
 totalPhotos = 12;
 type = venue;
 updated = "2013-07-30T14:36:13+0200";
 webUrl = "http://www.eyeem.com/a/541";
 },
 {
 favorited = 0;
 id = 12475;
 location =                 {
 cityAlbum =                     {
 id = 17;
 name = Berlin;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = city;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/17";
 };
 countryAlbum =                     {
 id = 23;
 name = Germany;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = country;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/23";
 };
 latitude = "52.501939857917";
 longitude = "13.448349237442";
 venueService =                     {
 category = 4bf58dd8d48988d124941735;
 categoryName = Office;
 id = 4adcda80f964a5202d4821e3;
 name = foursquare;
 };
 };
 muted = 0;
 name = Spreespeicher;
 photos =                 {
 items =                     (
 {
 height = 1936;
 id = 16616796;
 photoUrl = "http://www.eyeem.com/thumb/640/480/1aa00027af2f89199a6c34b241ea185321df23b3-1374644693";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/1aa00027af2f89199a6c34b241ea185321df23b3-1374644693";
 updated = "2013-07-24T07:44:52+0200";
 webUrl = "http://www.eyeem.com/p/16616796";
 width = 1936;
 },
 {
 height = 968;
 id = 14573471;
 photoUrl = "http://www.eyeem.com/thumb/640/480/83b18eef303dd5f5183766db131958f58a81c7ab-1371222279";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/83b18eef303dd5f5183766db131958f58a81c7ab-1371222279";
 updated = "2013-06-14T17:06:04+0200";
 webUrl = "http://www.eyeem.com/p/14573471";
 width = 1296;
 },
 {
 height = 568;
 id = 13158055;
 photoUrl = "http://www.eyeem.com/thumb/640/480/ab1f706e0bae7b4ca03c9279a590d4a827c1f4c9-1368966261";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/ab1f706e0bae7b4ca03c9279a590d4a827c1f4c9-1368966261";
 updated = "2013-05-19T14:24:39+0200";
 webUrl = "http://www.eyeem.com/p/13158055";
 width = 1296;
 },
 {
 height = 776;
 id = 5598845;
 photoUrl = "http://www.eyeem.com/thumb/640/480/e31b640dd4837cf19b63440cafa69dbe2b82f6f9-1359112890";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/e31b640dd4837cf19b63440cafa69dbe2b82f6f9-1359112890";
 updated = "2013-01-25T12:22:47+0100";
 webUrl = "http://www.eyeem.com/p/5598845";
 width = 775;
 },
 {
 height = 969;
 id = 1552669;
 photoUrl = "http://www.eyeem.com/thumb/640/480/ed1d4f94684bdacf3942de0fb1183b89dc1483f0-1354707712";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/ed1d4f94684bdacf3942de0fb1183b89dc1483f0-1354707712";
 updated = "2012-12-05T12:42:10+0100";
 webUrl = "http://www.eyeem.com/p/1552669";
 width = 968;
 },
 {
 height = 972;
 id = 1117337;
 photoUrl = "http://www.eyeem.com/thumb/640/480/031a0a5f03167b7c8bcde72f422d2f6bddadb594-1350378168";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/031a0a5f03167b7c8bcde72f422d2f6bddadb594-1350378168";
 updated = "2012-10-16T11:03:03+0200";
 webUrl = "http://www.eyeem.com/p/1117337";
 width = 1296;
 },
 {
 height = 1296;
 id = 1117322;
 photoUrl = "http://www.eyeem.com/thumb/640/480/e86c42f4ba56a1d0590059f6d58489a35a18bea9-1350377877";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/e86c42f4ba56a1d0590059f6d58489a35a18bea9-1350377877";
 updated = "2012-10-16T10:58:52+0200";
 webUrl = "http://www.eyeem.com/p/1117322";
 width = 972;
 },
 {
 height = 612;
 id = 4117068;
 photoUrl = "http://www.eyeem.com/thumb/640/480/0ce0d392f6665dbf46766e59657386a45596a3a6-1358541757";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/0ce0d392f6665dbf46766e59657386a45596a3a6-1358541757";
 updated = "2012-06-28T08:38:17+0200";
 webUrl = "http://www.eyeem.com/p/4117068";
 width = 612;
 },
 {
 height = 1296;
 id = 560250;
 photoUrl = "http://www.eyeem.com/thumb/640/480/8b10f1362243aa6f64f660f4b66d64951bc4a644-1338661800";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/8b10f1362243aa6f64f660f4b66d64951bc4a644-1338661800";
 updated = "2012-06-02T20:30:06+0200";
 webUrl = "http://www.eyeem.com/p/560250";
 width = 972;
 },
 {
 height = 612;
 id = 5279785;
 photoUrl = "http://www.eyeem.com/thumb/640/480/e66b8fdd25cdd66baecef77e59b1b643fd312280-1358947839";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/e66b8fdd25cdd66baecef77e59b1b643fd312280-1358947839";
 updated = "2012-05-27T22:16:33+0200";
 webUrl = "http://www.eyeem.com/p/5279785";
 width = 612;
 }
 );
 limit = 10;
 offset = 0;
 total = 11;
 };
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/531f671102015b2b7c7722942d2c3ac8839200df-1313245463";
 totalContributors = 10;
 totalLikers = 0;
 totalPhotos = 11;
 type = venue;
 updated = "2013-07-24T07:44:52+0200";
 webUrl = "http://www.eyeem.com/a/12475";
 },
 {
 favorited = 0;
 id = 325375;
 location =                 {
 cityAlbum =                     {
 id = 17;
 name = Berlin;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = city;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/17";
 };
 countryAlbum =                     {
 id = 23;
 name = Germany;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = country;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/23";
 };
 latitude = "52.50024414";
 longitude = "13.44768524";
 venueService =                     {
 category = 4bf58dd8d48988d162941735;
 categoryName = "Other Great Outdoors";
 id = 4eac17604690ef1f6c8f71e4;
 name = foursquare;
 };
 };
 muted = 0;
 name = "Gegen\U00fcber von Universal an der Spree";
 photos =                 {
 items =                     (
 {
 height = 1296;
 id = 13764210;
 photoUrl = "http://www.eyeem.com/thumb/640/480/3b8c8f486e70691294a28ad8edab9d112e62d169-1369925935";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/3b8c8f486e70691294a28ad8edab9d112e62d169-1369925935";
 updated = "2013-05-30T16:59:32+0200";
 webUrl = "http://www.eyeem.com/p/13764210";
 width = 972;
 },
 {
 height = 613;
 id = 2037784;
 photoUrl = "http://www.eyeem.com/thumb/640/480/5dbb8f4f77910453797d8622164846ceabd80c25-1356256685";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/5dbb8f4f77910453797d8622164846ceabd80c25-1356256685";
 updated = "2012-12-23T10:58:07+0100";
 webUrl = "http://www.eyeem.com/p/2037784";
 width = 1024;
 },
 {
 height = 613;
 id = 1757285;
 photoUrl = "http://www.eyeem.com/thumb/640/480/07284d3090fa00f00c6d58ca1eeab88e1c3859a7-1355938154";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/07284d3090fa00f00c6d58ca1eeab88e1c3859a7-1355938154";
 updated = "2012-12-19T18:29:15+0100";
 webUrl = "http://www.eyeem.com/p/1757285";
 width = 1024;
 },
 {
 height = 612;
 id = 1692652;
 photoUrl = "http://www.eyeem.com/thumb/640/480/c296ddad3af4ddec347861de5b8fb85ac23f5b09-1355832079";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/c296ddad3af4ddec347861de5b8fb85ac23f5b09-1355832079";
 updated = "2012-12-18T13:01:41+0100";
 webUrl = "http://www.eyeem.com/p/1692652";
 width = 816;
 },
 {
 height = 968;
 id = 690783;
 photoUrl = "http://www.eyeem.com/thumb/640/480/6a7e6b77e88517263ad5baddc5c650d6b86d3e50-1341433333";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/6a7e6b77e88517263ad5baddc5c650d6b86d3e50-1341433333";
 updated = "2012-07-04T22:22:26+0200";
 webUrl = "http://www.eyeem.com/p/690783";
 width = 1296;
 },
 {
 height = 1296;
 id = 690775;
 photoUrl = "http://www.eyeem.com/thumb/640/480/08b73abd63d1f642e5c1a6e66d09fd163131731e-1341433229";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/08b73abd63d1f642e5c1a6e66d09fd163131731e-1341433229";
 updated = "2012-07-04T22:20:40+0200";
 webUrl = "http://www.eyeem.com/p/690775";
 width = 968;
 },
 {
 height = 1296;
 id = 690772;
 photoUrl = "http://www.eyeem.com/thumb/640/480/d88334da83ff329895d8c55ce369221f288f4e76-1341433179";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/d88334da83ff329895d8c55ce369221f288f4e76-1341433179";
 updated = "2012-07-04T22:19:40+0200";
 webUrl = "http://www.eyeem.com/p/690772";
 width = 968;
 },
 {
 height = 1296;
 id = 690765;
 photoUrl = "http://www.eyeem.com/thumb/640/480/c80332b916c3ce42d9246ed7eb830395bf46ff3d-1341433062";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/c80332b916c3ce42d9246ed7eb830395bf46ff3d-1341433062";
 updated = "2012-07-04T22:17:45+0200";
 webUrl = "http://www.eyeem.com/p/690765";
 width = 968;
 },
 {
 height = 1296;
 id = 690763;
 photoUrl = "http://www.eyeem.com/thumb/640/480/5a4c2a3d9ccabbd27135d5098801d3e3408ef3c7-1341432948";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/5a4c2a3d9ccabbd27135d5098801d3e3408ef3c7-1341432948";
 updated = "2012-07-04T22:16:10+0200";
 webUrl = "http://www.eyeem.com/p/690763";
 width = 968;
 },
 {
 height = 968;
 id = 690625;
 photoUrl = "http://www.eyeem.com/thumb/640/480/5020249a4daf05dd09b87b0e73c40b00f80fefcf-1341430542";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/5020249a4daf05dd09b87b0e73c40b00f80fefcf-1341430542";
 updated = "2012-07-04T21:35:46+0200";
 webUrl = "http://www.eyeem.com/p/690625";
 width = 1296;
 }
 );
 limit = 10;
 offset = 0;
 total = 11;
 };
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/9fe982acbd60a706a9dbd387a68a6c4ec5c1bc49-1341430452";
 totalContributors = 4;
 totalLikers = 0;
 totalPhotos = 11;
 type = venue;
 updated = "2013-05-30T16:59:32+0200";
 webUrl = "http://www.eyeem.com/a/325375";
 },
 {
 favorited = 0;
 id = 80881;
 location =                 {
 cityAlbum =                     {
 id = 17;
 name = Berlin;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = city;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/17";
 };
 countryAlbum =                     {
 id = 23;
 name = Germany;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = country;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/23";
 };
 latitude = "52.49904293079";
 longitude = "13.449565894145";
 venueService =                     {
 category = 4bf58dd8d48988d124941735;
 categoryName = Office;
 id = 4b559450f964a52002e827e3;
 name = foursquare;
 };
 };
 muted = 0;
 name = "betterplace.org";
 photos =                 {
 items =                     (
 {
 height = 612;
 id = 17687297;
 photoUrl = "http://www.eyeem.com/thumb/640/480/5e9e6088d03dc784a23c7409eddd2c251b574c30-1376408755";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/5e9e6088d03dc784a23c7409eddd2c251b574c30-1376408755";
 updated = "2013-08-13T17:46:09+0200";
 webUrl = "http://www.eyeem.com/p/17687297";
 width = 816;
 },
 {
 height = 2048;
 id = 17079243;
 photoUrl = "http://www.eyeem.com/thumb/640/480/473982c1dfa939ab730a8ebfce02016396cd7dea-1375446271";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/473982c1dfa939ab730a8ebfce02016396cd7dea-1375446271";
 updated = "2013-08-02T14:24:57+0200";
 webUrl = "http://www.eyeem.com/p/17079243";
 width = 2048;
 },
 {
 height = 972;
 id = 14461080;
 photoUrl = "http://www.eyeem.com/thumb/640/480/90fb02daae1c62469a6e74529d69e7dd9afc360f-1371027347";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/90fb02daae1c62469a6e74529d69e7dd9afc360f-1371027347";
 updated = "2013-06-12T10:55:53+0200";
 webUrl = "http://www.eyeem.com/p/14461080";
 width = 1296;
 },
 {
 height = 1296;
 id = 14130943;
 photoUrl = "http://www.eyeem.com/thumb/640/480/4fdef40ab48e60278ac82a6d71cf00d931e46338-1370500244";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/4fdef40ab48e60278ac82a6d71cf00d931e46338-1370500244";
 updated = "2013-06-06T08:30:56+0200";
 webUrl = "http://www.eyeem.com/p/14130943";
 width = 1296;
 },
 {
 height = 969;
 id = 12080719;
 photoUrl = "http://www.eyeem.com/thumb/640/480/e48cd2d772957c1f3c82b0d890cc3ca882793439-1367241779";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/e48cd2d772957c1f3c82b0d890cc3ca882793439-1367241779";
 updated = "2013-04-29T15:23:17+0200";
 webUrl = "http://www.eyeem.com/p/12080719";
 width = 1296;
 },
 {
 height = 1296;
 id = 9111188;
 photoUrl = "http://www.eyeem.com/thumb/640/480/ea7595b8b3a08e473c1824bebaf04fe095e53ed9-1362764391";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/ea7595b8b3a08e473c1824bebaf04fe095e53ed9-1362764391";
 updated = "2013-03-08T18:40:08+0100";
 webUrl = "http://www.eyeem.com/p/9111188";
 width = 972;
 },
 {
 height = 972;
 id = 8543159;
 photoUrl = "http://www.eyeem.com/thumb/640/480/183e2f7293f1a542db6b20b5893f0e87385162d3-1361983598";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/183e2f7293f1a542db6b20b5893f0e87385162d3-1361983598";
 updated = "2013-02-27T17:46:49+0100";
 webUrl = "http://www.eyeem.com/p/8543159";
 width = 1296;
 },
 {
 height = 768;
 id = 5474169;
 photoUrl = "http://www.eyeem.com/thumb/640/480/4f32db830c013904e4f855b6279a829ca6392f1f-1359046048";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/4f32db830c013904e4f855b6279a829ca6392f1f-1359046048";
 updated = "2013-01-24T17:48:00+0100";
 webUrl = "http://www.eyeem.com/p/5474169";
 width = 1024;
 },
 {
 height = 768;
 id = 2850711;
 photoUrl = "http://www.eyeem.com/thumb/640/480/721560490b27adc2a5cb2aaf7d8d7e7237f47af0-1357912255";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/721560490b27adc2a5cb2aaf7d8d7e7237f47af0-1357912255";
 updated = "2013-01-11T14:51:11+0100";
 webUrl = "http://www.eyeem.com/p/2850711";
 width = 1024;
 },
 {
 height = 612;
 id = 4277746;
 photoUrl = "http://www.eyeem.com/thumb/640/480/f292a429e843b120dfc0a6886df75e2a4792e97d-1358588284";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/f292a429e843b120dfc0a6886df75e2a4792e97d-1358588284";
 updated = "2012-12-19T13:43:40+0100";
 webUrl = "http://www.eyeem.com/p/4277746";
 width = 612;
 }
 );
 limit = 10;
 offset = 0;
 total = 11;
 };
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/71979ee426949c7e335a9bc5aab663c4593452f7-1323684401";
 totalContributors = 4;
 totalLikers = 3;
 totalPhotos = 11;
 type = venue;
 updated = "2013-08-13T17:46:09+0200";
 webUrl = "http://www.eyeem.com/a/80881";
 },
 {
 favorited = 0;
 id = 435;
 location =                 {
 cityAlbum =                     {
 id = 17;
 name = Berlin;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = city;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/17";
 };
 countryAlbum =                     {
 id = 23;
 name = Germany;
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/4fbf551231917efbc913d5a689c982f8db2c5f7a-1358438528";
 type = country;
 updated = "2013-10-12T17:02:38+0200";
 webUrl = "http://www.eyeem.com/a/23";
 };
 latitude = "52.500235230375";
 longitude = "13.453574180603";
 venueService =                     {
 category = 4bf58dd8d48988d124941735;
 categoryName = Office;
 id = 4b1f5d5bf964a520d42524e3;
 name = foursquare;
 };
 };
 muted = 0;
 name = "MTV Networks Germany";
 photos =                 {
 items =                     (
 {
 height = 972;
 id = 12848634;
 photoUrl = "http://www.eyeem.com/thumb/640/480/b23fe5c6b7338a6643f3cbdc2b31fcc92059b38e-1368448141";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/b23fe5c6b7338a6643f3cbdc2b31fcc92059b38e-1368448141";
 updated = "2013-05-13T14:29:14+0200";
 webUrl = "http://www.eyeem.com/p/12848634";
 width = 1296;
 },
 {
 height = 1296;
 id = 10675900;
 photoUrl = "http://www.eyeem.com/thumb/640/480/7295e76c3407804b707db3b0ae628b448f0b4958-1365001841";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/7295e76c3407804b707db3b0ae628b448f0b4958-1365001841";
 updated = "2013-04-03T17:10:43+0200";
 webUrl = "http://www.eyeem.com/p/10675900";
 width = 968;
 },
 {
 height = 968;
 id = 8557412;
 photoUrl = "http://www.eyeem.com/thumb/640/480/2e0515690da2965caaff9c1f4b2d3116aca685ad-1362001623";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/2e0515690da2965caaff9c1f4b2d3116aca685ad-1362001623";
 updated = "2013-02-27T22:47:48+0100";
 webUrl = "http://www.eyeem.com/p/8557412";
 width = 968;
 },
 {
 height = 851;
 id = 7087413;
 photoUrl = "http://www.eyeem.com/thumb/640/480/310f70a835a1707efd3c929caddbd232f831495f-1360339350";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/310f70a835a1707efd3c929caddbd232f831495f-1360339350";
 updated = "2013-02-08T17:02:47+0100";
 webUrl = "http://www.eyeem.com/p/7087413";
 width = 851;
 },
 {
 height = 768;
 id = 1618742;
 photoUrl = "http://www.eyeem.com/thumb/640/480/76a2269225087f95c47956e59e556fc07543c723-1355227862";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/76a2269225087f95c47956e59e556fc07543c723-1355227862";
 updated = "2012-12-11T13:11:39+0100";
 webUrl = "http://www.eyeem.com/p/1618742";
 width = 1024;
 },
 {
 height = 768;
 id = 393901;
 photoUrl = "http://www.eyeem.com/thumb/640/480/6eeefbd75f6ac6d6290848ff516c4ac83c5b61ef-1335372867";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/6eeefbd75f6ac6d6290848ff516c4ac83c5b61ef-1335372867";
 updated = "2012-04-25T16:58:07+0200";
 webUrl = "http://www.eyeem.com/p/393901";
 width = 1024;
 },
 {
 height = 602;
 id = 156971;
 photoUrl = "http://www.eyeem.com/thumb/640/480/9e0ab6e040b8a8ba7ad97ab8d503c46e585ed255-1323855678";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/9e0ab6e040b8a8ba7ad97ab8d503c46e585ed255-1323855678";
 updated = "2011-12-14T09:41:47+0100";
 webUrl = "http://www.eyeem.com/p/156971";
 width = 800;
 },
 {
 height = 602;
 id = 139696;
 photoUrl = "http://www.eyeem.com/thumb/640/480/81f50073b78ad612fd2553a5cc9ec87dd94ad0a4-1322040201";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/81f50073b78ad612fd2553a5cc9ec87dd94ad0a4-1322040201";
 updated = "2011-11-23T09:23:45+0100";
 webUrl = "http://www.eyeem.com/p/139696";
 width = 800;
 },
 {
 height = 3264;
 id = 135023;
 photoUrl = "http://www.eyeem.com/thumb/640/480/e779442739b48c197ad63fad4c3ff3cdc1dfc428-1321296015";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/e779442739b48c197ad63fad4c3ff3cdc1dfc428-1321296015";
 updated = "2011-11-14T18:40:15+0100";
 webUrl = "http://www.eyeem.com/p/135023";
 width = 2448;
 },
 {
 height = 800;
 id = 79380;
 photoUrl = "http://www.eyeem.com/thumb/640/480/7630598b197066cf40f84974d85b810dbfaa2a94-1313160973";
 thumbUrl = "http://www.eyeem.com/thumb/h/100/7630598b197066cf40f84974d85b810dbfaa2a94-1313160973";
 updated = "2011-08-12T14:56:50+0200";
 webUrl = "http://www.eyeem.com/p/79380";
 width = 600;
 }
 );
 limit = 10;
 offset = 0;
 total = 10;
 };
 thumbUrl = "http://www.eyeem.com/thumb/sq/200/76a2269225087f95c47956e59e556fc07543c723-1355227862";
 totalContributors = 8;
 totalLikers = 0;
 totalPhotos = 10;
 type = venue;
 updated = "2013-05-13T14:29:14+0200";
 webUrl = "http://www.eyeem.com/a/435";
 }
 );
 limit = 10;
 offset = 0;
 total = 10;
 };
 }
 (lldb)
 **/
