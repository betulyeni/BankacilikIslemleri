require 'rspec'
require 'sqlite3'


def interval seconds
  loop do
    yield
    sleep seconds
  end
end

interval 30 do
  @db = SQLite3::Database.open 'user.db'
  query=@db.execute "SELECT * FROM hesap WHERE hesap_tur='faizli'"
  for i in query
    print i.to_s+"\n"
    olan_para=i[1].to_f
    faizli_para=olan_para+olan_para*0.10
    hesap_no=i[5]
    @db.execute "UPDATE hesap SET para_miktari='#{faizli_para}' WHERE hesap_no='#{hesap_no}'"
    puts hesap_no+" nolu hesap için faiz uygulandı."
  end
end