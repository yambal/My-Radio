# liquidsoap /home/yambal/liquidsoap/myscript.liq

#set("log.file.path","/home/yambal/liquidsoap/myscript.log")
set("log.stdout",true)

pl_electro=normalize(
	playlist(
		"https://yambal.github.io/My-Radio/playlists/electro.pls",
		mode="randomize",
		reload=28800,
		reload_mode="seconds"
	)
)
pl_chill=normalize(
	playlist(
		"https://yambal.github.io/My-Radio/playlists/chill.pls",
		mode="randomize",
		reload=28800,
		reload_mode="seconds"
	)
)
pl_ets2=normalize(
	playlist(
		"https://yambal.github.io/My-Radio/playlists/ets2.pls",
		mode="randomize",
		reload=28800,
		reload_mode="seconds"
	)
)

# myplaylist=playlist("~/liquidsoap/playlist0.pls")
# myplaylist=cross(duration=5.,crossfade,myplaylist)

jihou=single("~/music/se/jihou.mp3")
start_voice = single("~/music/start.mp3")

stream=fallback(
	[
		switch(
			track_sensitive=false,
			[
				({0h0m-0h2m}, once(jihou)),
				({1h0m-1h2m}, once(jihou)),
				({2h0m-3h0m}, pl_chill),
				({3h0m-3h2m}, once(jihou)),
				({4h0m-4h2m}, once(jihou)),
				({5h0m-5h2m}, once(jihou)),
				({6h0m-6h2m}, once(jihou)),
				({7h0m-7h2m}, once(jihou)),
				({8h0m-8h2m}, once(jihou)),
				({9h0m-9h2m}, once(jihou)),
				({10h0m-10h2m}, once(jihou)),
				({11h0m-11h2m}, once(jihou)),
				({12h0m-12h2m}, once(jihou)),
				({13h0m-13h2m}, once(jihou)),
				({14h0m-14h2m}, once(jihou)),
				({15h0m-16h0m}, pl_ets2),
				({16h0m-16h0m8s}, once(jihou)),
				({16h0m9s-16h59m59s}, pl_ets2),
				({17h0m-17h0m8s}, once(jihou)),
				({17h0m9s-17h59m59s}, pl_ets2),
				({18h0m-18h2m}, once(jihou)),
				({19h0m-19h2m}, once(jihou)),
				({20h0m-20h2m}, once(jihou)),
				({21h0m-21h2m}, once(jihou)),
				({22h0m-22h2m}, once(jihou)),
				({23h0m-23h2m}, once(jihou)),
				({true},pl_electro),
			]
		),
	start_voice,
	]
)

output.icecast(%mp3,
  host="std1.ladio.net",
  port=8060,
  password="ladio",
  mount="ets2jp",
  name="Euro truck Simulator Japan Radio",
  description="テスト配信です",
  encoding="UTF-8",
  url="https://twitter.com/Ets2Yambal",
  stream)
