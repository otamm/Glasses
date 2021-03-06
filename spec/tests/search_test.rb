  describe 'search' do

    it 'should search for an ActiveRecord model' do
      ((Glasses.search(Player,{first_name: "Jane"})).size).should == 1
    end

    it 'should search for an ActiveRecord model when input is only partial' do
      ((Glasses.search(Player,{first_name: "J"})).size).should == 2 # Jane & Jessica
    end

    it 'should return an empty array if no matches are found' do
      (Glasses.search(Player,{first_name: "HELLOOOOOOO IZE A PLAYAH"})).should == []
    end

    it 'should return an empty array if no matches are found' do
      (Glasses.search(Player,{first_name: "                 "})).should == []
    end

    context 'search with boolean' do
      it 'should search for an ActiveRecord model' do
        ((Glasses.search(Player,{first_name: "Jane", is_virgin_bool: '1'})).size).should == 1
      end

      it 'should search for an ActiveRecord model when input is only partial' do
        ((Glasses.search(Player,{first_name: "J", is_virgin_bool: '1'})).size).should == 2 # Jane & Jessica
      end

      it 'should return an empty array if no matches are found' do
        (Glasses.search(Player,{first_name: "Bobby", is_virgin_bool: '1'}).size).should == 0
      end
    end

  end