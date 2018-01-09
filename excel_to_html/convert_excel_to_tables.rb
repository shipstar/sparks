require 'roo'

class Hash
  def except!(*keys)
    keys.each { |key| self.delete(key) }
    self
  end

  def except(*keys)
    self.dup.except! *keys
  end
end

def html_row_element(row_obj)
  row_obj.except(row_obj.keys.first).map do |k,v|
    <<-EL
      <tr>
        <td><strong>#{k}</strong>: #{v}</td>
      </tr>
    EL
  end
end

def maybe_footer(row_obj)
  if row_obj["Footer"]
    <<-EL
      <tr>
        <td colspan="2">
          <hr>
          <br>
          #{row_obj["Footer"]}
        </td>
      </tr>
    EL
  else
    ''
  end
end

def html_table(row_obj)
  <<~HTML
    <table width="100%" border="0" cellpadding="4" cellspacing="4">
      <tbody>
        <tr>
          <th colspan=2 bgcolor="#E0E0E0"><strong>#{row_obj.first[1]}</strong></th>
        </tr>
        <tr>
          <td rowspan="#{row_obj.keys.size - 1}"><img src="/FCKEditorFiles//ImageFile.jpg" width="230" height="255" alt="" /></td>
        </tr>
        #{html_row_element(row_obj.except("Footer")).join.chomp}
        #{maybe_footer(row_obj).chomp}
      </tbody>
    </table>
  HTML
end

filename = ARGV[0]

row_objs = Roo::Spreadsheet.open(filename).sheet(0).parse(header_search: [])

File.open(filename.gsub('xlsx', 'html'), 'w') do |f|
  f.puts row_objs.map { |row_obj| html_table row_obj }
end
