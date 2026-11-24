class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.53"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.53/meghnaad-hook-0.8.53-aarch64-apple-darwin.tar.gz"
      sha256 "285468c963e6ef41f01133e6d8776a1d5aa5e739e90e6457e064bbb4f62310a7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.53/meghnaad-hook-0.8.53-x86_64-apple-darwin.tar.gz"
      sha256 "6fed75a413f57c6f82611e75047deb1530d6fee0db1c1ed46c63554c7b7dcf61"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.53/meghnaad-hook-0.8.53-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9a65d5e7404f382da50df5f7f8900d0b872f611260d6103b1605ddff6d68ea6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.53/meghnaad-hook-0.8.53-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc8fcc15f804b4a49750f596f4b8e5822479538ec06338086d1f3f8fee261732"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.53/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
