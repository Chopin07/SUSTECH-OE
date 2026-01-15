package com.example.directionmenu;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

public class Item extends RecyclerView.Adapter<Item.ItemAdapter> {

    private List<String> dataList;
    private Context context;

    public Item(Context context, List<String> dataList) {
        this.context = context;
        this.dataList = dataList;
    }

    @NonNull
    @Override
    public ItemAdapter onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(context).inflate(R.layout.itemlayout, parent, false);
        return new ItemAdapter(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ItemAdapter holder, int position) {
        holder.itemText.setText(dataList.get(position));
    }

    @Override
    public int getItemCount() {
        return dataList.size();
    }

    public static class ItemAdapter extends RecyclerView.ViewHolder {
        TextView itemText;

        public ItemAdapter(@NonNull View itemView) {
            super(itemView);
            itemText = itemView.findViewById(R.id.item_text);
        }
    }
}