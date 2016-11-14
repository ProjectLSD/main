<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
    <head>
                            <base href="/">
        
        <title>LSD</title>

                <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
		<meta name="google-site-verification" content="E3L1laZ9kfHkoMXG-NoiDwt1IcetetCNyjCLDmE9h7c" />
		<meta name="msvalidate.01" content="48E2EF7192F6B059BBC21E3BFD5E02E5" />
		<meta name="baidu-site-verification" content="lApAHd1WLc" />
		<meta name='yandex-verification' content='53922bc4d3b291da' />
		<meta name="keywords" content="free music, online music, free online music, internet radio, online radio, free internet radio, free online radio, radio stations, listen to music, listen to music online, listen to free music, radio online, listen to music free, internet radio stations, musicfm" />
        <meta name="fragment" content="!">
        <meta name="google" content="notranslate">

                    <meta name="title" content="musicfm - YouTube to MP3 Music Player" />
        
                    <meta name="description" content="Find, listen to millions of songs, albums, artists, lyrics, videos and easily convert YouTube to mp3, all completely free on musicfm." />
        
                <style>
            #splash,[ng-cloak]{display:none}#splash,.inner{position:absolute}[ng-cloak]#splash{display:flex!important}#splash{top:0;left:0;width:100%;height:100%;z-index:9999;justify-content:center;align-items:center}#splash-spinner{display:block!important;width:120px;height:120px;border-radius:50%;perspective:800px}.inner{box-sizing:border-box;width:100%;height:100%;border-radius:50%}.inner.one{left:0;top:0;animation:rotate-one 1s linear infinite;border-bottom:3px solid #84BD00}.inner.two{right:0;top:0;animation:rotate-two 1s linear infinite;border-right:3px solid #84BD00}.inner.three{right:0;bottom:0;animation:rotate-three 1s linear infinite;border-top:3px solid #84BD00}@keyframes  rotate-one{0%{transform:rotateX(35deg) rotateY(-45deg) rotateZ(0)}100%{transform:rotateX(35deg) rotateY(-45deg) rotateZ(360deg)}}@keyframes  rotate-two{0%{transform:rotateX(50deg) rotateY(10deg) rotateZ(0)}100%{transform:rotateX(50deg) rotateY(10deg) rotateZ(360deg)}}@keyframes  rotate-three{0%{transform:rotateX(35deg) rotateY(55deg) rotateZ(0)}100%{transform:rotateX(35deg) rotateY(55deg) rotateZ(360deg)}}
        </style>

                <link rel="stylesheet" id="main-stylesheet"
              href="https://www.musicfm.org/assets/css/custom-stylesheets/musicfm/styles.min.css?v25">
		
				<link rel="chrome-webstore-item" href="https://chrome.google.com/webstore/detail/foojnmlaebcekejlnagihjidoinbpicp">
		<link rel="chrome-webstore-item" href="https://chrome.google.com/webstore/detail/dafbmkdphkdehojjillnlgmlcofcjkke">
		
                <link href='https://fonts.googleapis.com/css?family=RobotoDraft:300,400,500,600,700' rel='stylesheet' type='text/css'>

                <link rel="apple-touch-icon" sizes="57x57" href="favicons/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="favicons/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="favicons/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="favicons/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="favicons/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="favicons/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="favicons/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="favicons/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="favicons/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="favicons/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="favicons/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="favicons/favicon-16x16.png">
        <link rel="manifest" href="favicons/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="favicons/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">
    </head>

    <body ng-app="app" global-dropdown-close ng-controller="AppController">
    <div id="splash" ng-cloak>
            <div id="splash-spinner">
                <div class="inner one"></div>
                <div class="inner two"></div>
                <div class="inner three"></div>
            </div>
        </div>

        <div ui-view="full" id="full-page-view"></div>

        <div class="app-container" ng-class="{ visible: !shouldPlayerControlsBeHidden() }">
            <section class="page-container" ng-cloak>
                <left-panel></left-panel>
                <search-panel></search-panel>

                <div class="middle-view">
                    <nav class="mobile-nav" ng-class="{ show: isPhone }">
                        <div class="toggle-icon" sidebar-toggler><i class="icon icon-menu"></i></div>
                        <div class="state-name"><!--{{ getCurrentStateName() }}--></div>
                        <div class="mobile-search-bar">
                            <i class="icon icon-search"></i>
                            <input type="text" class="mobile-search-bar" ng-model="search.query" ng-model-options="{ debounce: 400 }" ng-change="search.getResults(search.query)">
                            <i class="icon icon-spin6 spin search-bar-spinner" ng-if="search.ajaxInProgress"></i>
                        </div>
                    </nav>

                    <div ui-view id="main-view"></div>
                </div>

                <right-panel></right-panel>

                <div class="lyrics-container hidden" lyrics-container>
                    <div class="backdrop"></div>
                    <div class="modal-inner-container">
                        <div id="lyrics-panel" class="scroll-container" pretty-scrollbar></div>
                        <div class="close-lyrics-icon"><i class="icon icon-cancel"></i></div>
                    </div>
                </div>

                <div class="player-container hidden" video-container ng-class="{ show: utils.getSetting('show_youtube_player') && ! isPhone }">
                    <div class="modal-inner-container video-inner-container">
                        <div id="player"></div>
                        <div class="yt-overlay" ng-if="utils.getSetting('block_youtube_embed_clicks')"></div>
                        <div class="close-lyrics-icon"><i class="icon icon-cancel"></i></div>
                        <div class="toggle-fullscreen" ng-if="utils.getSetting('show_fullscreen_button')"><i class="icon icon-resize-full"></i></div>
                    </div>
                    <div class="backdrop"></div>
                </div>

                <div id="context-menu" class="hidden" context-menu ng-controller="ContextMenuController">
                    <div class="header">
                        <div class="image"></div>
                        <div class="info">
                            <div class="name"></div>
                            <div class="sub-name"></div>
                        </div>
                    </div>
                    <div class="body">
                        <add-to-playlist class="slide-out"></add-to-playlist>
                    </div>
                </div>
            </section>

            <player-controls></player-controls>
        </div>
		        <script id="vars">
            var vars = {
                user: '',
                baseUrl: 'https://www.musicfm.org',
                selectedLocale: 'en',
                trans: {"404NotFound":"404 Not Found.","noResultsFoundFor":"No results found for","noResultsExpl":"Please make sure you have correctly spelled your words or try to use different or less keywords.","search":"Search","viewAllResults":"View All Results...","register":"Sign Up","login":"Log In","email":"Email","password":"Password","forgot":"Forgot?","rememberMe":"Remember me","noAccount":"Don't have an account?","registerHere":"Sign Up","orLoginWith":"\/ Log In with :","wrongCredentials":"Wrong email address or password","alreadyHaveAccount":"Already have an account?","repeatPassword":"Repeat Password","logInHere":"Log In.","passwordRecovery":"Password Recovery","passResetExpl":"Please enter the email address associated with your account.","sendEmail":"Send Email","cancel":"Cancel","enterYourTwitterEmail":"Enter your email on twitter","requestPassword":"An account with this email address already exists, if you want to connect the two accounts please enter existing accounts password in the field below.","enterYourPassword":"Enter your password","connect":"Connect","userWithEmailExists":"User with this email already exists","wrongPassword":"Password seems to be incorrect, please try again.","confirmEmailMessage":"Registration successful! Please confirm your email address by clicking a link in a message from us.","emailConfirmSuccess":"Your email has been confirmed successfully!","emailConfirmed":"Emailed Confirmed","yourMusic":"Favorites","songs":"Songs","albums":"Albums","artists":"Artists","song":"Song","album":"Album","artist":"Artist","newPlaylist":"New Playlist","enterPlaylistsName":"Enter name of the playlist","create":"Create","playlistNameExists":"You have already created a playlist with that name.","playlists":"Playlists","newReleases":"New Disc","noResults":"No Results","popularGenres":"Popular Genres","top50":"Top Songs","popularAlbums":"Top Albums","top-songs":"Top","new-releases":"New","top-albums":"Top","popular-genres":"Genres","play":"Play","pause":"Pause","save":"Save","lyrics":"Lyrics","couldntFindTrack":"Sorry, this song is not available for streaming.","couldntDownloadTrack":"Sorry, this song is not available for downloading.","noLyricsFound":"Could not find lyrics for this song.","radioNoMoreTracks":"There are no more suggestions for this artist.","resetPasswordTitle":"Reset Password","resetPassword":"Reset Password","resetErrors":"There were some problems with your input.","emailAddress":"E-Mail Address","confirmPassword":"Confirm Password","newPassword":"New Password","releaseDate":"Release Date","runningLength":"Running Length","runningTime":"Running Time","latestAlbumsFirst":"Latest Albums First","mostPopAlbumsFirst":"Most Popular Albums First","oldestAlbumsFirst":"Oldest Albums First","variousArtists":"Various Artists","noAlbumsInLibrary":"You have not added any albums to your favorites yet.","noAlbumsExpl":"Albums will appear here once you add some songs or albums via 'Add to Favorites' option from anywhere on the site.","songsInYourLib":"Songs in your favorites","popularity":"Popularity","name":"Name","numberOfTracks":"Number Of Songs","sortedBy":"Sorted By","filter":"Filter...","popularSongs":"Popular Songs","similarArtists":"Similar Artists","playAll":"Play All","noArtistsInLibrary":"You have not added any artists to your favorites yet.","noArtistsExpl":"Artists will appear here once you add some songs or albums via 'Add to Favorites' option from anywhere on the site.","startArtistRadio":"Start Artist Radio","artistRadio":"Artist Radio","more":"More","about":"About","showMore":"Show More","showLess":"Show Less","noBioFound":"Couldn't find biography or images for this artist.","biography":"Biography","images":"Images","length":"Length","dateAdded":"Date Added","duration":"Duration","albumName":"Title","artistName":"Artist","noSongsInLibrary":"You have not added any songs to your favorites yet.","noSongsExpl":"Songs will appear here once you add some via 'Add to Favorites' option from anywhere on the site.","noSongsMatchCriteria":"No songs have matched your search criteria.","improvedStation":"Improved station!","addToQueue":"Add to Queue","removeFromQueue":"Remove from Queue","addToPlaylist":"Add to Playlist","removeFromPlaylist":"Remove from this playlist","back":"Back","addToYourMusic":"Add to Favorites","copySongLink":"Copy Song Link","linkCopySuccess":"Copied Link to Clipboard","linkCopyFail":"Failed to Copy Link to Clipboard","options":"Options","copyAlbumLink":"Copy Album Link","copyArtistLink":"Copy Artist Link","addedTracksToLibrary":"Added songs to your favorites","createdBy":"Created By","tracks":"Tracks","playlistEmpty":"This playlist is currently empty","deleteForever":"Delete Forever","delete":"Delete","confirmPlaylistDelete":"Are you sure you want to permanently delete this playlist?","confirmPlaylistDelete2":"Warning: You can't undo this action.","rename":"Rename","description":"Description","updatePlaylist":"Update Playlist","addedToPlaylist":"Added Track to Playlist","playlistToPrivate":"Made playlist private.","playlistToPublic":"Made playlist public.","follow":"Follow","unfollow":"Unfollow","sharePlaylist":"Share Playlist","renamePlaylist":"Rename Playlist","deletePlaylist":"Delete Playlist","copyPlaylistLink":"Copy Playlist Link to Clipboard","makePlaylistPublic":"Make Playlist Public","makePlaylistPrivate":"Make Playlist Private","share":"Share & Get $10","sendLinkViaEmail":"Send this link via email","messageOptional":"Message (optional)","copyLink":"Copy Link","genericError":"Something went wrong, please try again later.","linkShareSubject":":email shared ':name' with you.","sentEmailsSuccess":"Sent emails successfully","listenTo":"Listen to","on":"on","searchResultsFor":"Search results for","all":"All","seeAll":"See All","viewMore":"View More","analytics":"Analytics","users":"Users","settings":"Settings","ads":"Ads","translations":"Translations","appearance":"Appearance","selectLocale":"Select a Locale","createLocale":"Create a New Locale","createdNewLocale":"Created a new locale.","updatedTranslations":"Translations have been updated.","logOut":"Log Out","logOutSuccess":"You have been logged out.","translationsReset":"Translations for active locale have been reset.","confirmLangReset":"Are you sure you want to reset language lines for selected locale?","resetTranslations":"Reset Translations","reset":"Reset","cantDeleteEn":"You can't delete original 'en' locale.","searchForLangLine":"Search for language line","noPermissions":"You don't have required permissions to do that.","noDemoPermissions":"Sorry, you can't do that on demo site.","enterStylesheetName":"Enter New Stylesheets Name","availableStylesheets":"Available Stylesheets","createNew":"Create New","stylesheetExists":"Stylesheet with that name already exists.","original":"Original","customCss":"Custom CSS","errorInCustomCss":"You have an error in your custom css: ","gotIt":"Got It","yes":"Yes","no":"No","deleteStylesheet":"Delete Selected Stylesheet","confirmStylesheetDelete":"Are you sure you want to delete this stylesheet?","stylesheetDeleteSuccess":"Stylesheet has been deleted.","stylesheetResetSuccess":"Stylesheet has been reset.","stylesheetRenameSuccess":"Stylesheet has been renamed.","cantDeleteOriginalSheet":"You can't delete original stylesheet.","cantRenameOriginalSheet":"You can't rename original stylesheet.","resetStylesheetVars":"Reset Stylesheet","confirmStylesheetVarsReset":"Are you sure you want to reset this stylesheets styles to original values?","homepage":"Homepage","homepageExpl":"Which page do you want to display as your homepage.","siteName":"Site Name","metaDescription":"Meta Description","metaTitle":"Meta Title","dateLocale":"Date Locale","dateLocaleExpl":"Locale you want dates formatted in. ISO 639-1 code","enablePushState":"Enable HTML5 PushState mode","pushStateExpl":"This will remove # from your site urls.","enableRegistration":"Enable Registration","enableRegistrationExpl":"If this is set to 'No', registration page and all links\/references will be disabled and users will not be able to register on their own.","3rdPartyServiceKeys":"Third Party Service Keys","showKeys":"Show Keys","socialLoginKeysExpl":"Enter your credentials for social login services and providers that you are using below. You can find information on how to get them in the documentation.","providersExpl":"Here you can set from where various music data will be fetched. If set to 'Local', only your manually created data will be used and musicfm will not try to fetch information from any 3rd party sites.","googleAnalyticsCode":"Google analytics tracking code","googleAnalyticsCodeExpl":"Looks like this: UA-******-2 (numbers instead of stars)","id":"ID","secret":"Secret","artistImagesProvider":"Artist Images Provider","albumImagesProvider":"Album Images Provider","generalSettings":"General Settings","default":"Default","loginPage":"Login Page","customPage":"Custom Page","customHomepagePath":"Custom Homepage Path","customHomepagePathExpl":"Path to your custom homepage file. Relative to root folder or url on internet.","transLocale":"Translations Locale","siteLogo":"Site Logo","transLocaleExpl":"Currently active translations locale on the site.","localization":"Localization","manage":"Manage","homepageGenres":"Homepage Genres","homepageGenresExpl":"Genres to display on homepage. Separate with a comma. If left empty, most popular genres will be used.","settingsUpdated":"Settings have been updated.","primaryHomeSection":"Primary Home Section","requireConfirmation":"Require Email Confirmation","emailConfirmExpl":"Will users need to confirm their email address before being able to use their account after registration.","primaryHomeSectionExpl":"Which section should be the default one if user have not selected one.","cache":"Cache","cacheDriver":"Cache Driver","saveBioToDB":"Save artist Biography to local database","artistBioProvider":"Artist Biography (About Tab) Provider","setPlaylistsToPublic":"Set user playlists to public by default","cacheDriverExpl":"Important! If you don't know what these options mean, leave it set to 'file'","table":"Table","connection":"Connection","day":"Day","days":"Days","weeks":"Weeks","week":"Week","month":"Month","never":"Never","every":"Every","artistUpdateInterval":"Artist Update Interval","artistUpdateIntervalExpl":"How often artists (and their albums and songs) should be updated from external sites.","homepageUpdateInterval":"Homepage Update Interval","homepageUpdateIntervalExpl":"How often homepages (latest albums, top50, popular albums etc) should be updated.","forceLogin":"Force Login","forceLoginExpl":"When this option is set to 'Yes', users will need to login before being able to access the site.","searchProvider":"Search Provider","dataProvider":"Data Provider","dataProviderExpl":"Set to local database if you don't want to fetch anything automatically and instead want to create and upload artists, albums, songs etc manually.","searchProviderExpl":"When not set to 'local', external sites will be used to perform search, meaning users will be able to find pretty much any artist, album or song.","youtubeApiExpl":"Required. Needed in order to fetch youtube song id.","providers":"Providers","genresProvider":"Genres Provider","enableHttps":"Enable HTTPS","newReleasesProvider":"New Releases Provider","topSongsProvider":"Top 50 Songs Provider","local":"Local","localDatabase":"Local Database","youtubeRegionCode":"Youtube Region Code","youtubeRegionCodeExpl":"For what country should youtube results be returned. US recommended. ISO 3166-1 alpha-2 Code.","player":"Player","showPlayer":"Show Small Player","showPlayerExpl":"Should small player be shown in the bottom right corner by default.","showDownloadButton":"Show Download Button","hideLyricsButton":"Hide Lyrics Button","hideVideoButton":"Hide Video Button","hideQueueByDefault":"Hide Player Queue by Default","blockedArtists":"Blocked Artists","blockedArtistsExpl":"Artists that should be blocked on the site (they will not be searchable, indexable, or appear on the site in any other way. Separate each one with newline (enter), * can be used as a wildcard.","playerProvider":"Player Provider","playerProviderExpl":"What service should be used to stream music on the site. Note that if you have added url to a song manually from admin area player will stream from that url automatically, otherwise provider set here will be used.","showFullscreenButton":"Enable\/Disable full screen toggle button on video modal.","defaultPlayerVolume":"Default player volume (1 to 100)","wikipediaLang":"Wikipedia Language Code","clearedCache":"Site cache has been cleared","clearCache":"Clear Cache","generateSitemap":"Generate Sitemap","sitemapGenerated":"Sitemap has been generated","version":"Version","rowsPerPage":"Rows per page","avatar":"Avatar","firstName":"First Name","oldPassword":"Old Password","passwordChangeSuccess":"Your password has been changed.","avatarAcceptedFormats":"Accepted formats: png, jpeg.","avatarResizeExpl":"Your avatar will be resized to 200x200 (px) if it's bigger then that.","remove":"Remove","avatarRemoveSuccess":"Your avatar has been removed.","changePassword":"Change Password","lastName":"Last Name","username":"Username","gender":"Gender","notSaying":"Not Saying","add":"Add","cantDeleteAdmin":"Admin accounts can't be deleted","male":"Male","female":"Female","createdNewUser":"New user has been created.","createNewUser":"Create a New User","updatedUser":"User has been updated.","updateUser":"Update User","usersSelected":"Users Selected","emailNotConfirmed":"Email address for this user is not yet confirmed.","songsSelected":"Songs Selected","deleted":":number items have been deleted.","youtubeId":"Youtube ID","updateTrack":"Update Track","updatedTrack":"Track has been updated.","showingSongs":"Showing songs","showingUsers":"Showing users","of":"of","to":"to","trackUrlExpl":"Direct url to song file on your server or internet","url":"Url","number":"Number","newTrack":"New Track","createTrack":"Create a New Song","createdTrack":"New song has been created","numOfAlbums":"Number of Albums","numOfTracks":"Number of Tracks","updateArtist":"Update Artist","updatedArtist":"Artist has been updated","createdArtist":"Artist has been created","imageSmall":"Small Image","imageLarge":"Large Image","artistsSelected":"Artists Selected","showingArtists":"Showing artists","newArtist":"New Artist","updateAlbum":"Update Album","updatedAlbum":"Album has been updated","createdAlbum":"Album has been created","albumsSelected":"Albums Selected","showingAlbums":"Showing albums","image":"Image","editAlbum":"Edit Album","deleteAlbum":"Delete Album","newAlbum":"New Album","genres":"Genres","uploadImage":"Upload Image","uploadFile":"Upload File","confirmAlbumDelete":"Are you sure you want to delete this album?","newAlbumNoArtist":"Can't find artist with that name. Please create it first.","newAlbumNameExists":"This artist already has an album with that name.","deleteTracks":"Delete Tracks","totalUsers":"Total Users","totalArtists":"Total Artists","totalTracks":"Total Tracks","totalAlbums":"Total Albums","mailTemplateSaved":"Template has been saved.","mailTemplates":"Mail Templates","linkTemplate":"Share email template","confirmationTemplate":"Email confirmation template","verifyEmailSubject":"Verify your email address at","passwordTemplate":"Password reminder template","mail":"Mail","mailDriver":"Mail Driver","mailDriverExpl":"What should be used to send emails?","host":"host","port":"port","mailUsername":"Username","mailPassword":"Password","fromAddress":"Global from address","fromName":"Global from name","manageTemplates":"Manage Templates","overview":"Overview","publicPlaylists":"Public Playlists","following":"Following","followers":"Followers","noPublicPlaylists":"Seems like this user does not have any public playlists yet.","editUsername":"Edit Username","changeAvatar":"Change Avatar","accountSettings":"Account Settings","adminArea":"Admin Area","profileUpdateSuccess":"Your profile has been updated.","topHits":"Top Hits","topViral50":"Top Viral 50","timeMatchine":"Time Matchine","genresMoods":"Genres Moods","specialPickup":"Special Pickup","appExtension":"App Extension","copyrightPolicy":"Copyright Policy","youtubeToMp3":"Download Song","buyFromAmazon":"Buy From Amazon","tryOurApp":"Do try out our app & extension, it is cool !","thankInstall":"Thank you for installing our app & extension !","radioChannels":"Radio Channels","reloadRadio":"An error occured. Please try refreshing or reloading this page again.","selectLanguage":"Select Language","selectCountry":"Select Country","couldntFindCharts":"Sorry, this chart does not exist.","contactUs":"Contact Enquiry","contactUsProblems":"If you have any questions, please don't hesitate to contact us.","contactName":"Name","contactEmail":"E-mail","contactSubject":"Subject","contactMessage":"Message","singles":"Singles","shareMusic":"Share","startDiscoverRadio":"Discover","cleanQueue":"Clear Play Queue","browse":"Browse","usefulLinks":"Useful Links","youtubeMP3":"YouTube MP3","youtubeToMp3Convert":"YouTube to MP3 Converter","convert":"Convert","invalidURL":"Invalid YouTube video URL !","affiliate":"Get $10","affiliates":"Get $10 Just To Share Music !"},
                settings: {"homepage":"default","enableRegistration":"1","siteName":"musicfm - YouTube Music Player","enablePushState":"1","dateLocale":"en","pushStateRootUrl":"\/","homepageGenres":"","primaryHomeSection":"browse","artist_update_interval":"1","latest_albums_update_interval":"1","homepage_update_interval":"1","force_login":"0","search_provider":"Spotify","enable_https":"1","latest_albums_strict":"1","top_songs_provider":"local","youtube_region_code":"US","show_youtube_player":"0","hide_lyrics_button":"0","hide_video_button":"0","show_download_button":"0","hide_queue":"0","youtube_api_key":"AIzaSyDOVff_Qw9c6WgzYZiU_abBDjIfS1gsMGE","soundcloud_api_key":"746c32a13878054e13509d8775e58a8e","default_player_volume":"100","player_provider":"Youtube","show_fullscreen_button":"1","require_email_confirmation":"0","data_provider":"spotify","save_artist_bio":"1","playlists_public_by_default":"1","genre_provider":"last.fm","artist_bio_provider":"wikipedia","wikipedia_language":"en","metaTitle":"musicfm - YouTube to MP3 Music Player","metaDescription":"Find, listen to millions of songs, albums, artists, lyrics, videos and easily convert YouTube to mp3, all completely free on musicfm.","new_releases_meta_desc":"Browse and listen to newest releases from popular artists.","popular_albums_meta_desc":"Most popular albums from hottest artists today.","top50_meta_desc":"Global Top 50 chart of most popular songs.","popular_genres_meta_desc":"Browse popular genres to discover new music.","analytics":"UA-76493340-1","echonest_api_key":"","blockedArtists":"HELLYEAH\nFive Finger Death Punch\nThe Word Alive\nWhitechapel\nReal Friends\nAmado Batista\nCaetano Veloso","images_provider":"real","artist_images_provider":"real","album_provider":"Spotify","artist_provider":"Spotify","genres_provider":"Lastfm","new_releases_provider":"Spotify","top_albums_provider":"Local","top_tracks_provider":"Spotify","audio_search_provider":"Youtube","radio_provider":"Spotify","selected_sheet":"musicfm","logo_url":"custom_logo_light.png"},
                isDemo: '0',
                message: "",
                version: "2.0.3",
            }
        </script>

        <script src="https://www.musicfm.org/assets/js/core.min.js?v25"></script>

        
                    <script>
                (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

				function getParameterByName(name, url) {
					if (!url)
						url = window.location.href;
					name = name.replace(/[\[\]]/g, "\\$&");
					var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"), results = regex.exec(url);
					if (!results)
						return null;
					if (!results[2])
						return '';
					return decodeURIComponent(results[2].replace(/\+/g, " "));
				}
				
				var refID = getParameterByName('ref');
				var refURL = document.referrer;
				
				ga('create', 'UA-76493340-1', 'auto');
                ga('send', 'pageview');
				
				if(refID && refURL)
				{
					ga('require', 'ecommerce');
					ga('ecommerce:addTransaction', {
						'id': refID,
						'affiliation': 'UserID-' + refID,
						'revenue': '0.001',
						'shipping': '0',
						'tax': '0.00',
						'currency': 'USD'
					});
					ga('ecommerce:send');
					
					ga('send', 'event', 'UserID : ' + refID, 'Shared To : ' + refURL, 'Shared URL : ' + window.location.pathname, 1);
				}
            </script>
            </body>
</html>