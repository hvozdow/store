module WelcomeHelper
    def newest_product
        @product =  Product.order('created_at desc').limit(4)
        render 'newest_product'
    end
    
    def chipest_product
        @product = Product.order('price asc').limit(6)
        render 'chipest_product'
    end
    
    def other_product
        @product = Product.where.not(id: newest_product).order('count_in_stock asc').limit(12)
        render 'other_product'
    end  
    
    def similar_product
        @product = Product.order('count_in_stock asc').limit(5)
        #@product = тут будет алгоритм поиска похожего продукта, нужно придумать.
        render 'similar_product'
    end
    
end
