module Bullhorn
module Rest
module Entities

module Resume
  extend Base

  def parse_to_candidate(resume_html)
  	path = "resume/parseToCandidate?format=html&populateDescription=html"

    resume_file = Tempfile.new('Resume.txt')
    resume_file.write(resume_html)
    resume_file.rewind

    payload = {
      file: Faraday::UploadIO.new(resume_file, 'application/text', 'Resume.txt')
    }

    res = conn.post path, payload

    JSON.parse(res.body)
  end

  # PDF only for now
  def convert_to_html_from_pdf(resume_file)
    path = 'resume/convertToHtml?format=pdf'

    payload = {
      file: Faraday::UploadIO.new(resume_file, 'application/pdf', 'Resume.pdf')
    }

    res = conn.post(path, payload)
    JSON.parse(res.body)
  end
end

end
end
end
