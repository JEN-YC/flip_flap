# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = []
    rows = tsv.split("\n").map { |row| row.split("\t") }
    header = rows.first
    rows[1..-1].each do |row|
      @data << header.zip(row).to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    result = ''
    result << merge_keys(@data.first)
    @data.each do |hash|
      result << merge_values(hash)
    end
    @data = result
  end
end

def merge_keys(row)
  row.keys.join("\t") + "\n"
end

def merge_values(row)
  row.values.join("\t") + "\n"
end
