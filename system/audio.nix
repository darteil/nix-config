{ ... }:

{
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    extraConfig = ''
      load-module module-echo-cancel use_master_format=1 aec_method=webrtc aec_args="analog_gain_control=0 digital_gain_control=1" source_name=echocancel sink_name=echocancelsink
      set-default-source echocancel
      #set-default-sink echocancelsink
      default-sample-rate = 96000
    '';
  };
}
