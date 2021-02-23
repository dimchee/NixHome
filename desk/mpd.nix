{ config, pkgs, lib, ... }:

with lib;

let
  mpdConf = pkgs.writeText "mpd.conf" ''
    music_directory     "~/Library/Music"
    playlist_directory  "~/Library/Mpd/playlists"
    db_file             "~/Library/Mpd/tag_cache"
    state_file          "~/Library/Mpd/state"
    sticker_file        "~/Library/Mpd/sticker.sql"
    auto_update         "yes"
  '';
in {
  #systemd.user.sockets.mpd = {
  #  description = "Music Player Daemon Socket";
  #  wantedBy = [ "sockets.target" ];
  #  listenStreams = [ "127.0.0.1" ];
  #  socketConfig = {
  #    Backlog = 5;
  #    KeepAlive = true;
  #    PassCredentials = true;
  #  };
  #};

  systemd.user.services.mpd = {
    description = "Music Player Daemon";
    after = [ "network.target" "sound.target" ];
    wantedBy = [ "default.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.mpd}/bin/mpd --no-daemon ${mpdConf}";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
