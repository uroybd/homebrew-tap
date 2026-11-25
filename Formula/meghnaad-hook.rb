class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.60"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.60/meghnaad-hook-0.8.60-aarch64-apple-darwin.tar.gz"
      sha256 "b5c1c3dbaf8d1d409cb22fa46243710f0594b3822242b5932ca1334819517351"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.60/meghnaad-hook-0.8.60-x86_64-apple-darwin.tar.gz"
      sha256 "1154d72bd28977c6bdc64906e8ed6256b06d28d0823c7ed9660e1b8859cafcbc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.60/meghnaad-hook-0.8.60-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "06f2358372dcbc607f56e9da8da45e7157590b74375d738feccfdf018222f80f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.60/meghnaad-hook-0.8.60-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b25f2225c87f2d24bfcf169a4d42f58256ff34f943243d9be7ce404cbb45be1a"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.60/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
