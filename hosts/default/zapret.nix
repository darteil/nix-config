{ ... }:
{
  services.zapret = {
    enable = true;
    whitelist = [
      "youtube.com"
      "googlevideo.com"
      "ytimg.com"
      "youtu.be"
      "discord.com"
      "discord-attachmets-uploads-prd.storage.googleapis.com"
      "googleapis.com"
    ];
    params = [
      "--dpi-desync=fake,disorder2"
      "--dpi-desync-ttl=1"
      "--dpi-desync-autottl=2"
    ];
  };
}
