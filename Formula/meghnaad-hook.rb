class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.34/meghnaad-hook-0.8.34-aarch64-apple-darwin.tar.gz"
      sha256 "224e78bef0956c9238da0de685487ca52d299e98e41d25c7a4b3e6ca2eb7c398"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.34/meghnaad-hook-0.8.34-x86_64-apple-darwin.tar.gz"
      sha256 "a41b7e4e9183e91c87e601fde0362f8203c5433a29b5d9344b8badbcb1641b1f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.34/meghnaad-hook-0.8.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed85bca15562f2f36069cf0862a3f20af67b00673f55104879c076dedc3392a4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.34/meghnaad-hook-0.8.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df27c4067066340e065b4a4dbeba3e00d4ee46dfd9f60b5c18f85dfed0875ba7"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.34/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
