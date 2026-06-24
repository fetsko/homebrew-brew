class MongodbMongocryptdAT80 < Formula
  desc "mongocryptd service for Client Side Encryption"
  homepage "https://www.mongodb.com/"

  if Hardware::CPU.intel?
    url "https://downloads.mongodb.com/osx/mongodb-cryptd-macos-x86_64-enterprise-8.0.99.tgz"
    sha256 "4444444444444444444444444444444444444444444444444444444444444444"
  else
    url "https://downloads.mongodb.com/osx/mongodb-cryptd-macos-arm64-enterprise-8.0.99.tgz"
    sha256 "7777777777777777777777777777777777777777777777777777777777777777"
  end
  license "MongoDB Customer Agreement"

  def caveats
    <<~EOS
      mongocryptd is licensed under the MongoDB Customer Agreement (https://www.mongodb.com/customer-agreement). Except for evaluation purposes, you may not use mongocryptd without a commercial license from MongoDB.
    EOS
  end

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/mongocryptd", "--version"
  end
end
