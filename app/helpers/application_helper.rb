module ApplicationHelper
  def show_meta_tags
    assign_meta_tags if display_mata_tags.blank?
    display_mata_tags
  end

  def default_meta_tags
    {
      site: 'Railsめも',
      title: 'Railsのちょっとしたコードやエラー内容を確認するのに使える!',
      reverse: true, #trueの場合、ページ名とサイト名が逆になる
      separator: '|', #ウェブサイト名とページタイトルを区切るために使用されるテキスト
      description: 'Railsで書いたコードを保存したり、見返せることができます。',
      keywords: 'ちょこっとメモ',
      canonical: request.original_url, #正規リンクタグを追加する
      noindex: ! Rails.env.production?, #noarchive メタタグを追加
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('railsmemo-homepage.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og: {
        type: 'website',
        title: title.presence || '@あなたのツイッターアカウント',
        description: :description,
        url: request.original_url,
        image: image_url('railsmemo-homepage.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@',
        image: image_url('railsmemo-homepage.png') #配置するパスやファイル名によって変更
      }
    }
  end
end
