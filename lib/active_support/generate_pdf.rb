module GeneratePdf
  extend ActiveSupport::Concern

  included do
    scope :disabled, -> { where(disabled: true) }
  end

  module ClassMethods
    def has_flier_pdf(s3_url, processed)
      define_method("process_file") do
        files = ["story.html", "presentation.html", "player.html"]
        entry = "index.html"

        url = self.send(s3_url.to_s)

        rcf = Utilities::RemoteCompressedFile.new(url)
        rcf.download
        rcf.unzip

        files.each do |f|
          if File.file?(rcf.temp_dir + "/" + f)
            entry = f
          end
          break if entry == f
        end

        rcf.upload_contents
        rcf.cleanup

        url = (url.split('/')[0..-2] << URI.escape("#{rcf.prefix}/#{entry}", '/')).join('/')
        self.send "#{s3_url}=", url
        self.send "#{processed}=", true
        self.save
      end

      define_method("enqueue") do
        Resque.enqueue(Utilities::RemoteCompressedFileJob, self.class.name, self.id)
      end
    end
  end

end

Sequel::Model.send(:include, GeneratePdfdS3)
