class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.56"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.56/meghnaad-hook-0.6.56-aarch64-apple-darwin.tar.gz"
      sha256 "03ab34bb2c418289ec303b574eb982ff5dfefe116f21b428d5e1a88446134570"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.56/meghnaad-hook-0.6.56-x86_64-apple-darwin.tar.gz"
      sha256 "1d51ec123b1247532b6947582ba8db6cbfb0f496da713fd9b3fc496d75178eb2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.56/meghnaad-hook-0.6.56-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "71442ab2ea9c7160a2a69aaa14d27039ef5628585313f9fcaaaaf05213cae6f2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.56/meghnaad-hook-0.6.56-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "39730b548c121f0e21e70dda3654b4675f8e6b14d0570fac568b047b7774f609"
    end
  end

  def install
    bin.install "meghnaad-hook"
  end

  def caveats
    <<~EOS
      Point task at your script, once (and again when it defines a hook it did not before):
        meghnaad-hook check ~/hooks.lua
        meghnaad-hook install ~/hooks.lua
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.56/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
