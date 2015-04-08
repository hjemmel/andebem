package br.com.andebem.components.crud.filter
{
	import mx.collections.ArrayCollection;
	import mx.containers.Form;
	import mx.containers.FormItem;
	import mx.core.UIComponent;
	
	public class FilterUtil
	{
		
		public static function filter(provider:ArrayCollection, form:Form):void
		{
			
			if(provider == null)
			{
				return;
			}
			
			var fields:Array = new Array()
			for each (var formItem:FormItem in form.getChildren())
			{
				
				var comp:UIComponent = UIComponent(formItem.getChildren()[0]);
				if (comp is IFilter)
				{
					fields.push(comp);
				}
			}
			
			
			var isFiltered:Boolean = false;
			for each (var field:IFilter in fields)
			{
				if (field.fieldValue != "")
				{
					isFiltered = true;
				}
			}
			
			if (!isFiltered)
			{
				provider.filterFunction = null;
				provider.refresh();
				return;
			}
			
			provider.filterFunction = function(item:Object):Boolean
			{
				for each (var field:IFilter in fields)
				{
					if (field.fieldValue != "")
					{
						//precisa estar separa pq passa no teste e da erro no if abaixo
						if (item[field.field] == null)
						{
							return false;
						}
						
						if (item[field.field].toString().toUpperCase().indexOf(field.fieldValue.toUpperCase()) == -1)
						{
							return false;
						}
					}
				}
				
				return true;
			};
			provider.refresh();
		}
		
		public static function clean(provider:ArrayCollection, form:Form):void
		{
			provider.filterFunction = null;
			provider.refresh();
			for each (var formItem:FormItem in form.getChildren())
			{
				var comp:UIComponent = UIComponent(formItem.getChildren()[0]);
				if (comp is IFilter)
				{
					IFilter(comp).clean();
				}
			}
		}
		
	}
}